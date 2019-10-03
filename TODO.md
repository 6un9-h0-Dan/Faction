# Faction TODO
If you'd like to contribute to the project but don't know what to do, this represents a list of things that are on our short term goals for Faction. Its totally cool if you want to work on your own thing thats not on this list. If its a major change/feature please reach out to @jaredhaight on Twitter or in the Bloodhound slack to talk about the details, that way you're not working on something that won't actually be merged.

## Bug fixes and testing
There's a list of [issues here](https://github.com/FactionC2/Faction/issues/) that represent known problems wtih Faction.

The other thing that needs to be done is to see what can be done to *try* and break Faction.

## Modules
* Mimikatz
* Ghostpack (don't know if this should be split out or not)
  - Rubeus
  - SharpUp
  - Seatbelt
  - SharpDump
* Sharphound
* Persistance (SharPersist maybe?)
* AD Exploration (PowerView functionality)

## Existing Module Updates
### stdlib
* Screenshot command (not sure if we can write this in such a way to be platform agnostic)

### winlib
* steal_token
* make_token

## Transports
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

### Process Injection
The way I see this working, the following things will need to be created

* A way to generate shellcode for a given payload. This likely will be added to the build servers for a given language, or alternatively added as an option in `FactionAgent.language.json` which would provide a command to run against a specified payload that would return shellcode (for example, leveraging donut)
* A way to allow the user to specify they want shellcode on the command line. I suspect this will be surfaced in a similar way as the `f2:file/foo` for commands that use files. Probably something like `f2:shellcode/payloadname`. 
* A module that handles shellcode injection. My thoughts are to leverage TikiLoader from TikiTorch for this.

### Auto-Complete Improvements
Right now, we have more of an "auto tell you what to type" setup in the console. It works by watching the console input and using that to filter down the list of available commands. Once the user presses "space", if the user has typed a valid command a list of parameters is displayed.

The big improvement we'd like to make is catching the tab key and using that to properly autocomplete options. The way I see this working is when tab is presesd, the position of the cursor is sent to an "autocomplete" function. This function (or series of functions) handles spliting the input string into three parts: the first part of the command, the word being autocompleted, and the rest of the command. The word is autocompeted, the three parts of the command being typed are combined again, the cursor is set at the end of the autocompleted word, and the contents of the input replaced with this new string.

On the API side, I'd like to include files uploaded to Faction in the autocomplete (so when you type `f2:files` it allows you to easily complete filenames.

### Logging
Faction has a pretty well fleshed out database schema that we can use to generate logs. My thoughts around this are to add some API endpoints for logging that kick off SQL queries, returning the results as CSV files. I'm not interested in generating "ready to ship reports", this feature should be centered around providing details around Faction usage. Some ideas of logs that should be available:

* Activitiy: A log detailing tasks and results. Columns should include AgentName, InternalIp, Username, Operator Username, Activity Type (AgentTask or AgentTaskResult), Mitre reference (if available)
* Agent Lifecycle: A log detailing what agents were spawned from which payload, transports used, etc
* IOCs: A log detailing the IOCs created by Agent Activity

### Version information
This is detailed a bit here: https://github.com/FactionC2/Faction/issues/31
