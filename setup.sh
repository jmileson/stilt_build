# install docker
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common


curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# configure docker to work with non sudo user
sudo usermod -aG docker "$USER"

# Clone GitHub repo for R wrapper
git clone https://github.com/benfasoli/stilt --depth=1 --single-branch

echo "Log out of the system, then log back in."

