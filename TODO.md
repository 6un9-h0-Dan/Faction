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
* DNS
* Websockets

## Functionality
Functionality is typically going to involve multiple changes across Faction components. If you'd like to work on something here, please open an issue so we can discuss it before you get to deep in implementation

### Enhancements
There's a list of enhancements that have been created in the [Faction issues page](https://github.com/FactionC2/Faction/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement). They've been tagged `enhancement`

### Process Injection
The way I see this working, the following things will need to be created

* A way to generate shellcode for a given payload. Faction Agents will get an additional configuration setting in `FactionAgent.dotnet.json` that will provide the command to run to get shellcode.
* A way to allow the user to specify they want shellcode on the command line. I suspect this will be surfaced in a similar way as the `f2:file/foo` for commands that use files. Probably something like `f2:shellcode/payloadname`. 
* A module that handles shellcode injection. My thoughts are to leverage TikiLoader from TikiTorch for this.

### Auto-Complete in the Console
Because of the way commands are registered from modules, we have details on each command, its parameters, and in some cases the values of said paramaters. This *should* be able to be handled through the API with an endpoint like `/agent/:agent_id/command/` or something. 

The idea here would be that you post a message with the partial command, the endpoint replies with a list of potential matches, filtered based on what modules are loaded by the agent.

Console wise we could probably just leverage one of the billion VueJS autocomplete modules.

### Version information
This is detailed a bit here: https://github.com/FactionC2/Faction/issues/31
