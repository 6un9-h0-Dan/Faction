# Install dependencies
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python3 \
    python3-pip

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update again to refresh packages
sudo apt-get update

# Install docker
sudo apt-get install -y docker-compose

# Starting docker
sudo service docker start

# Setup Faction Folders
sudo mkdir -p /opt/faction/
sudo chown $USER:$USER /opt/faction

mkdir -p /opt/faction/agents
mkdir -p /opt/faction/data
mkdir -p /opt/faction/global
mkdir -p /opt/faction/install
mkdir -p /opt/faction/modules
mkdir -p /opt/faction/uploads/payloads
mkdir -p /opt/faction/uploads/files

cp -R ./components/Marauder /opt/faction/agents
cp -R ./components/dotnet-modules /opt/faction/modules/dotnet
cp -R ./components/cli /opt/faction/
cp -R ./components/factiondb /opt/faction/install
cp -R ./services /opt/faction/services

sudo chgrp -R 1337 /opt/faction/uploads
sudo chmod -R 775 /opt/faction/uploads

# Install Faction Client
cd /opt/faction/cli
sudo python3 -m pip install pipenv
sudo python3 -m pipenv install --system
sudo python3 setup.py install
faction complete | sudo tee /etc/bash_completion.d/faction > /dev/null