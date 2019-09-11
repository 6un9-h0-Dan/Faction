# Faction Changelog
Because of the microservice nature of Faction, there's no one set "version" for Faction. Its always assumed that the master branch of [each repository](https://github.com/FactionC2) is the latest stable version. Here we try and keep track of major enhancements and bug fixes for the various components in Faction. The dates may not be _entirely_ accurate but try to represent significant updates to the project up to the point specified.

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
