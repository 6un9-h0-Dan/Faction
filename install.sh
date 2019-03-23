#!/bin/bash

while getopts "k:" opt
 do
    case $opt in
    k)  github_pat=$OPTARG
        ;;
    esac
done

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python3 \
    python3-pip \
    git

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update again to refresh packages
sudo apt-get update

# Install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Starting docker
sudo service docker start

# Setup Faction Folders
sudo mkdir -p /opt/faction/
sudo chown $USER:$USER /opt/faction

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

sudo chgrp -R 1337 /opt/faction/uploads
sudo chgrp -R 1337 /opt/faction/certs
sudo chmod -R 775 /opt/faction/uploads
sudo chmod -R 775 /opt/faction/certs

git clone https://github.com/FactionC2/CLI /opt/faction/cli

# Install Faction Client
cd /opt/faction/cli
sudo python3 -m pip install pipenv
sudo python3 -m pipenv install --system
sudo python3 setup.py install
faction complete | sudo tee /etc/bash_completion.d/faction > /dev/null

# Complete!
echo "Faction is ready for setup. Run 'faction setup' to get started"