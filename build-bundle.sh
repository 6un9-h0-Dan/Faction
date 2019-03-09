#!/bin/bash

rm ~/faction-bundle.zip
rm -rf ~/faction-bundle/*
mkdir ~/faction-bundle/components
cp ./install.sh ~/faction-bundle/
cp -R ./factiondb ~/faction-bundle/components/
cp -R /opt/faction/agents/Marauder ~/faction-bundle/components/
cp -R /opt/faction/modules/dotnet ~/faction-bundle/components/dotnet-modules
cp -R ~/source/faction/cli ~/faction-bundle/components/
cp -R /opt/faction/services ~/faction-bundle/

rm -rf ~/faction-bundle/components/cli/Faction_CLI.egg-info
rm -rf ~/faction-bundle/components/cli/dist
rm -rf ~/faction-bundle/components/cli/.idea

rm -rf ~/faction-bundle/components/Marauder/build/*
rm -rf ~/faction-bundle/components/Marauder/packages/*
rm -rf ~/faction-bundle/components/Marauder/bin
rm -rf ~/faction-bundle/components/Marauder/obj
rm -rf ~/faction-bundle/components/Marauder/.vs
rm -rf ~/faction-bundle/components/Marauder/.vscode

rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/packages/*
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/bin
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/obj
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/.vs
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/.vscode
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/StandardLibrary/obj
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/StandardLibrary/.vs
rm -rf ~/faction-bundle/components/dotnet-modules/StandardLibrary/StandardLibrary/.vscode

rm -rf ~/faction-bundle/services/core/packages/*
rm -rf ~/faction-bundle/services/core/bin
rm -rf ~/faction-bundle/services/core/obj
rm -rf ~/faction-bundle/services/core/.vs
rm -rf ~/faction-bundle/services/core/.vscode

rm -rf ~/faction-bundle/services/dotnet-build/Builds/*
rm -rf ~/faction-bundle/services/dotnet-build/out
rm -rf ~/faction-bundle/services/dotnet-build/obj
rm -rf ~/faction-bundle/services/dotnet-build/bin
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/packages/*
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/bin
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/obj
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/.vs
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/.vscode
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/StandardLibrary/obj
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/StandardLibrary/.vs
rm -rf ~/faction-bundle/services/dotnet-build/StandardLibrary/StandardLibrary/.vscode

rm -rf ~/faction-bundle/services/console/node_modules
rm -rf ~/faction-bundle/services/console/.vscode
rm -rf ~/faction-bundle/services/console/dist

rm -rf ~/faction-bundle/services/api/__pycache__
rm -rf ~/faction-bundle/services/api/.idea/
rm -rf ~/faction-bundle/services/api/apis/__pycache__
rm -rf ~/faction-bundle/services/api/apis/rest/__pycache__
rm -rf ~/faction-bundle/services/api/backend/__pycache__
rm -rf ~/faction-bundle/services/api/processing/__pycache__
rm -rf ~/faction-bundle/services/api/models/__pycache__
rm -rf ~/faction-bundle/services/api/processing/__pycache__

rm -rf ~/faction-bundle/components/cli/.git
rm -rf ~/faction-bundle/components/dotnet-modules/.git
rm -rf ~/faction-bundle/components/Marauder/.git
rm -rf ~/faction-bundle/services/api/.git
rm -rf ~/faction-bundle/services/console/.git
rm -rf ~/faction-bundle/services/core/.git
rm -rf ~/faction-bundle/services/dotnet-build/.git
zip -r ~/faction-bundle.zip ~/faction-bundle/*