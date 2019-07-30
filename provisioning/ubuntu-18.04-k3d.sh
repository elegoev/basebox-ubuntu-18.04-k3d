#!/bin/bash

# Ubuntu provisioning file
sudo apt update

# install k3s without agent
curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash

# create date string
DATE=`date +%Y%m%d%H%M`

# store k3s version
K3S_VERSION=$(sudo k3d --version | awk  '{print $3}' | tr --delete v)
echo "$K3S_VERSION.$DATE" > /vagrant/version
