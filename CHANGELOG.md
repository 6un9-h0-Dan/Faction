# Faction Changelog
Because of the microservice nature of Faction, there's no one set "version" for Faction. Its always assumed that the master branch of [each repository](https://github.com/FactionC2) is the latest stable version. Here we try and keep track of major enhancements and bug fixes for the various components in Faction. The dates may not be _entirely_ accurate but try to represent significant updates to the project up to the point specified.

## 2019-10-20
### FactionPy
* New project to centeralize code for Database, RabbitMQ, and related functionality

### CLI
* Updated CLI to leverage FactionPy for DB interactions and creating new objects (users, roles, transports, etc)
* This fixed some issues that came up in migrating to .NET Core 3.0
* Dependency Updates

### Core
* [Fixed an issue](https://github.com/FactionC2/Core/commit/dd5fa6d53578e6680abe28ba6367990ada4163bb) where Core would crash if you entered an empty SET command ([for reals this time](https://github.com/FactionC2/Faction/issues/34))
* Upgraded to .NET Core 3.0
* Dependency Updates

### .NET Build Server
* Upgraded to .NET Core 3.0
* Updated Docker image to use lastest version of Mono in the 6.x branch
* Dependency Updates

### API
* [Better error handling](https://github.com/FactionC2/API/pull/67) around loading config values (Thanks @3lpsy!)
* [Logging improvements](https://github.com/FactionC2/API/pull/68) (Thanks @3lpsy!)
* Dependency Updates

### Console
* Dependency Updates

## 2019-09-23
### CLI
* Logging rotation/compression added to Docker Contatiners (thanks @n1xbyte!)
* Added `--release` switch to pick from installing Faction from stable or development sources
* Changed `--build` switch to `--build-from-source`
* Changed `--dev` switch to `--build-for-dev-environment`
* Dependency updates

### Console
* Commands and parameters now [autocomplete](https://github.com/FactionC2/Console/commit/41c69708295c965ddbd8ec3749d191dfa9c2bed7) ([also here](https://github.com/FactionC2/Console/commit/7e7ac5839c67ff27bee7f3c147e1272f6ac084a6))
* [Cleaned up the agents list](https://github.com/FactionC2/Console/commit/2575edc01d3c82f88eb9127062a4b13248e61f5a) on console view to make it easier to read
* [Updated "New Payload" modal window](https://github.com/FactionC2/Console/commit/2575edc01d3c82f88eb9127062a4b13248e61f5a##diff-2f015550c60a424aa151aed7dbc86ad8) to pick the first option for each selection, so now you just have to set your changes
* Switched REST API calls to [putting the API token in the URL](https://github.com/FactionC2/Console/commit/09f0882112234ea6c76dda86e72d6e3619eb8ada) vs relying on cookies (which was causing some issues)
* [Made logging clearer](https://github.com/FactionC2/Console/commit/7e7ac5839c67ff27bee7f3c147e1272f6ac084a6)
* Dependency updates

### Core
* [Autocomplete updates](https://github.com/FactionC2/Core/commit/0fc1c0c5919dbd2f3cb3100bbb7c9652bdfec96a)
* [Fixes crash](https://github.com/FactionC2/Core/commit/f190671492ec9340aa86333d70d32de3e97764e0) when a show command was sent without telling Core what to show.
* Dependency updates

### API
* [Added Commands API endpoint](https://github.com/FactionC2/API/commit/bfbdb4c61336575e5e6dc55c8cbad1fe12d8756c) (used for autocomplete)
* [CORS update](https://github.com/FactionC2/API/commit/3c9b727e7992235eca3fc17acae0416c18d5bf9c) for socketio (need to revisit if we even need to do this in production)
* Dependency updates

### Build-Server-Dotnet
* Dependency updates

### Faction.Common
* [Added agentCommandsUpdated](https://github.com/FactionC2/Faction.Common/commit/b17268cc735ded959b0d3eefaba473069a95e930) message type
* Dependency updates

## 2019-09-11
### CLI
* [Updated](https://github.com/FactionC2/CLI/commit/d95ca78bde2566db5e31185e4c55f76093113d5c) git pulls to only pull master branches

## 2019-07-21
### Core
* [Fixed](https://github.com/FactionC2/Core/pull/15) that problem where [if you typed something that wasn't a command, Faction would crash](https://github.com/FactionC2/Faction/issues/30)

#### Docs
* Completely [new docs site](https://www.factionc2.com) hosted through Gitbook. 
* API documentation greatly improved

### API
* Fixed the [Agent Console Message API](https://github.com/FactionC2/API/pull/39/files#diff-eaea58bf509d066552409d14f6e7051dL30)
* Removed Transports ability to delete transports (https://github.com/FactionC2/API/pull/39/files#diff-a7c7e5ca31d61f4ea674904c357e83b4L44)
* [Changed the APIKey URL](https://github.com/FactionC2/API/pull/39/files#diff-3f41e546893dc64b71aaacad12cad815R66) from `/api/v1/user/:user_id/apikeys/` to `/api/v1/user/:user_id/apikey/`
* Merged in changes from 2019-07-07. Whoops.

### Console
* Merged in changes form 2019-07-07

## 2019-07-14
### TransportHTTP
* Added [Configurable Default Request Handling](https://github.com/FactionC2/TransportHTTP/pull/7). Details [here](https://github.com/FactionC2/TransportHTTP#default-response)

## 2019-07-07
### TransportHTTP
* [Completely re-wrote profile format](https://github.com/FactionC2/TransportHTTP/pull/5) (which meant rewriting basically the whole transport too..)
* [Added Azure Pipelines](https://github.com/FactionC2/TransportHTTP/pull/5) so we can devops the crap out of this thing

### Marauder
* Updated HTTP Transport to comply with new profile stuff

### API
* Fixed a possible JSON formatting issue where [single quotes were used instead of double](https://github.com/FactionC2/API/pull/32). Great catch @s3b4stian!
* Fixed an issue with the Transport API [not sending the right params](https://github.com/FactionC2/API/pull/18/) (Thanks @s3b4stian!!)
* Updated dependencies

### Console
* When you submit a new password, [the password fields are cleared](https://github.com/FactionC2/Console/pull/10) (Thanks @Static-Flow!)
* Updated depenencies

### CLI
* [Many](https://github.com/FactionC2/CLI/pull/13) [imporovements](https://github.com/FactionC2/CLI/pull/17) to the `--build` option, allowing users to build Faction docker containers from scratch. (Thanks @s3b4stian!)
* [CLI now prompts for IP address/hostname if one isn't specified](https://github.com/FactionC2/CLI/pull/11)(Thanks @c24dotspace!)
* [Added Error handling around IP Address/Hostname entry](https://github.com/FactionC2/CLI/pull/9)(Thanks @digital-shokunin!)
* Updated dependencies

## 2019-06-03
### TransportHTTP
* Updated SSL config to allow for TLS1.0 and TLS1.1

### Marauder
* PR from @s3b4stian to allow Marauder to speak TLS1.1 and TLS1.2
* More logging for the HTTP Transport module
* Added Azure Pipelines CI (It totally doesn't work yet, but its the thought that counts)

### Console
* Added warning about possible long login time ([issue #10](https://github.com/FactionC2/Faction/issues/10))

## 2019-05-22
### Console
* Fixed issue with deleted transports not being updated

### API
* Fixed issue with transport updates not being broadcast
* Fixed issue with new transports not showing up (again)
* Updated packages for real this time.
* Dropped logging down to WARNING (from DEBUG)

## 2019-05-17
### Docs
* Added API information for [Transports](https://www.factionc2.com/docs/development/api/#transport)
* Expanded a little on how [Build Servers](https://www.factionc2.com/docs/components/#build-servers) work.

### Faction.Common
* Added a `NewAgent` message type

### API
* Updated packages so Github stop yelling at me about vulns
* Fixed Transport messaging so Console can display new transports as they come in
* Actually setup the REST endpoint at `/api/v1/agent/[agent_id]/console/`. Whoops.

### Core
* Fixed how Core passes messages for a new transport.
* Switched to the `NewAgent` message type instead of passing a full Agent object over JSON
* Fixed issue where all hell would break loose if you had the audacity to miss type a module name in a `load` command

### Console
* Updated to Vue CLI 3
* Added the name of the transport that an agent is using to home and console pages.

### .NET Build Server
* Fixed an issue where we were trying to run python build scripts without actually having python available

### CLI
* Fixed an install issue. How did this thing ever work?
* Added a `credentials` command so you don't have to check `/opt/faction/global/config.json` to view what the default passwords for your instance are.
* @rmikehodges added a `logs` command so you can easily view logs from docker

### TransportHTTP
* Fixed install issues
* Updated config to support specifing a port number
