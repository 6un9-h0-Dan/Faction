while getopts "k:" opt; do
    case "$opt" in
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
    unzip

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

# Download the CLI
if [ -z ${github_pat+x} ]; then
    echo "Downloading Faction CLI.."
    curl -L https://github.com/FactionC2/CLI/archive/master.zip > /opt/faction/cli/cli.zip
else    
    echo "Downloading Faction CLI using Github Access Key.."
    curl -H "Authorization: token $github_pat" -L https://github.com/FactionC2/CLI/archive/master.zip > /opt/faction/cli/cli.zip
fi

unzip /opt/faction/cli/cli.zip -d /opt/faction/cli
mv /opt/faction/cli/CLI-master/* /opt/faction/cli/
rm -rf /opt/faction/cli/CLI-master/

# Install Faction Client
cd /opt/faction/cli
sudo python3 -m pip install pipenv
sudo python3 -m pipenv install --system
sudo python3 setup.py install
faction complete | sudo tee /etc/bash_completion.d/faction > /dev/null

# Complete!
echo "Faction is ready for setup. Run 'faction setup' to get started"