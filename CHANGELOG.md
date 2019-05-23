# Faction Changelog
Because of the microservice nature of Faction, there's no one set "version" for Faction. Its always assumed that the master branch of [each repository](https://github.com/FactionC2) is the latest stable version. Here we try and keep track of major enhancements and bug fixes for the various components in Faction. The dates may not be _entirely_ accurate but try to represent significant updates to the project up to the point specified.


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