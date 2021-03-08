#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install k3d without agent
curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash

# install kubectl
sudo snap install kubectl --classic

# install helm
sudo snap install helm --classic

# set version
DOCKER_VERSION=$(sudo docker version --format '{{.Server.Version}}')
KUBECTL_VERSION=$(sudo snap info kubectl | grep installed | awk  '{print $2}')
HELM_VERSION=$(sudo snap info helm | grep installed | awk  '{print $2}')
K3D_VERSION=$(sudo k3d --version | grep k3d | awk  '{print $3}' | tr --delete v)
K3S_VERSION=$(sudo k3d --version | grep k3s | awk  '{print $3}' | tr --delete v)
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> Docker:  $DOCKER_VERSION" >> $application_file_path
echo "> Kubectl: $KUBECTL_VERSION" >> $application_file_path
echo "> Helm:    $HELM_VERSION" >> $application_file_path
echo "> k3d $K3D_VERSION with k3s $K3S_VERSION" >> $application_file_path


