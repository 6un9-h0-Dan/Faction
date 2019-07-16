#!/bin/ash

while getopts "k:" opt
 do
    case $opt in
    k)  github_pat=$OPTARG
        ;;
    esac
done

# Install dependencies
apk update
apk add ca-certificates
apk add curl
apk add gnupg
apk add python3
apk add python3-dev
apk add python
apk add python-dev
apk add py-pip
apk add libffi-dev
apk add openssl-dev
apk add gcc
apk add libc-dev
apk add make
apk add yaml
apk add yaml-dev
apk add postgresql-libs
apk add --virtual .build-deps gcc musl-dev postgresql-dev
apk add git

apk update
apk upgrade

# Install docker
apk add docker --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
rc-update add docker boot
pip install docker-compose

# Starting docker
service docker start

# Setup Faction Folders
mkdir -p /opt/faction/
chown $USER:$USER /opt/faction

echo "Making Faction folder structure.."
mkdir -p /opt/faction/agents/build
mkdir -p /opt/faction/cli
mkdir -p /opt/faction/certs
mkdir -p /opt/faction/data
mkdir -p /opt/faction/global
mkdir -p /opt/faction/install
mkdir -p /opt/faction/modules
mkdir -p /opt/faction/uploads/payloads
mkdir -p /opt/faction/uploads/files

chgrp -R 1337 /opt/faction/uploads
chgrp -R 1337 /opt/faction/certs
chmod -R 775 /opt/faction/uploads
chmod -R 775 /opt/faction/certs

git clone https://github.com/FactionC2/CLI /opt/faction/cli

# Install Faction Client
cd /opt/faction/cli
pip install --upgrade pip
python3 -m pip install pipenv
python3 -m pipenv install --system
python3 setup.py install

# Complete!
echo "Faction is ready for setup. Run 'faction setup' to get started"
