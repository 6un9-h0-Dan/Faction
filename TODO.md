# Faction TODO
If you'd like to contribute to the project but don't know what to do, this represents a list of things that are on our short term goals for Faction. Its totally cool if you want to work on your own thing thats not on this list. If its a major change/feature please reach out to @jaredhaight on Twitter or in the Bloodhound slack to talk about the details, that way you're not working on something that won't actually be merged.

## Bug fixes and testing
There's a list of [issues here](https://github.com/FactionC2/Faction/issues/) that represent known problems wtih Faction.

The other thing that needs to be done is to see what can be done to *try* and break Faction.

## Modules
Building and updating modules will involve playing around with .NET. Details on how to build modules are covered [here](https://www.factionc2.com/developing/modules/dotnet). Of everything on this list, modules are probably the easiest thing to build in Faction.. at least they're supposed to be.

### New Modules
* Mimikatz
* Ghostpack (don't know if this should be split out or not)
  - Rubeus
  - SharpUp
  - Seatbelt
  - SharpDump
* Sharphound
* Persistance (SharPersist maybe?)
* AD Exploration (PowerView functionality)

### Existing Module Updates
* stdlib
  - Screenshot command (not sure if we can write this in such a way to be platform agnostic)
* winlib
  - steal_token
  - make_token

## Transports
Transports are a little more complicated to build, they consist of an agent module (written in .NET for now) that handles communicating with a transport server (written in whatever language you want), which in turn handles communicating with the Faction API.

### New Transport Types
* DNS
* Websockets

### HTTP Transport Updates
* Automatic Let's Encrypt enrollment. There are a couple of .NET packages for ACME that should make this relatively easy.
* Profile enhancements. There's plenty of room for improvement in the functionality of the HTTP profiles, including things like:
  - Mangling payload messages. Right now the profile just embeds the encrypted, base64 encoded message in the body of response. We should have additional options for mangling the message using different encodings.
  - Splitting the message between multiple spots in an HTML document

## Functionality
Functionality is typically going to involve multiple changes across Faction components. If you'd like to work on something here, please open an issue so we can discuss it before you get to deep in implementation

### Enhancements
There's a list of enhancements that have been created in the [Faction issues page](https://github.com/FactionC2/Faction/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement). They've been tagged `enhancement`

### Auto-Run Commands
It'd be nice to have an option to auto-run commands when an agent first checks in. This would be best implemented by adding the ability to add a list of commands to a payload, that way you could have different payloads set to auto-run different commands (like a phishing specific payload that runs some recon commands on first checkin).

Implementing this would involve:
  * Updating the DB to add an "AutoRunCommands" field. Since there's no native List<string> type for a database, we'd probably have to store the commands as a base64 encoded strings seperated by commas. Then when we retrieved these strings, we'd split the string on the commas, base64 decode the results. This way commands could have a comma in them without throwing off the retrieval. This will require programming in .NET
  * Updating Core to add these commands to an agents checkin response. Right now when an agent checks in, Core creates a series of "SET" commands (updates the name, agent password, jitter, beacon internval, etc). We'd need to update this process to add any auto-run commands to this list. This could leverage the existing command processing to generate tasks, just send each command provided through as if it was entered on the console. This will require programming in .NET
  * Update API to return these autorun commands (base64 decoded) in response to /api/v1/payload requests. This will require programming in Python.
  * Update Console to surface this functionality on the Payload creation page. This could be as simple as textbox which each command entered on a new line. This will require programing in Vue/Javascript

### Process Injection
The way I see this working, the following things will need to be created.

* A way to generate shellcode for a given payload. This likely will be added to the build servers for a given language, or alternatively added as an option in `FactionAgent.language.json` which would provide a command to run against a specified payload that would return shellcode (for example, leveraging donut). This will require programming in .NET
* A way to allow the user to specify they want shellcode on the command line. I suspect this will be surfaced in a similar way as the `f2:file/foo` for commands that use files. Probably something like `f2:shellcode/payloadname`. This will require changes to the API (python) and Console (Vue/javascript).
* A module that handles shellcode injection. My thoughts are to leverage TikiLoader from TikiTorch for this. This would require .NET programming

### Auto-Complete Improvements
Right now, we have more of an "auto tell you what to type" setup in the console. It works by watching the console input and using that to filter down the list of available commands. Once the user presses "space", if the user has typed a valid command a list of parameters is displayed.

The big improvement we'd like to make is catching the tab key and using that to properly autocomplete options. The way I see this working is when tab is pressed, the position of the cursor is sent to an "autocomplete" function. This function (or series of functions) handles spliting the input string into three parts: the first part of the command, the word being autocompleted, and the rest of the command. The word is autocompeted, the three parts of the command being typed are combined again, the cursor is set at the end of the autocompleted word, and the contents of the input replaced with this new string. This will involve changes to the Console, which means writting in Vue/Javascript

I'd also like to include files uploaded to Faction in the autocomplete so when you type `f2:files` it allows you to easily complete filenames. This will involve changes to API (python) and Console (Vue/js)

### Logging
Faction has a pretty well fleshed out database schema that we can use to generate logs. My thoughts around this are to add some API endpoints for logging that kick off SQL queries, returning the results as CSV files. I'm not interested in generating "ready to ship reports", this feature should be centered around providing details around Faction usage. Some ideas of logs that should be available:

* Activitiy: A log detailing tasks and results. Columns should include AgentName, InternalIp, Username, Operator Username, Activity Type (AgentTask or AgentTaskResult), Mitre reference (if available)
* Agent Lifecycle: A log detailing what agents were spawned from which payload, transports used, etc
* IOCs: A log detailing the IOCs created by Agent Activity

This will involve updates to the API (python) and some minor updates to the console (Vue/js)

### Version information
This is detailed a bit here: https://github.com/FactionC2/Faction/issues/31. It touches on all aspects of the Faction stack, so would involve coding in Python, .NET, and Vue/javascript
