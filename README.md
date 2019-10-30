## ubuntu-18.04-k3d
Vagrant Box with Ubuntu 18.04 & k3d

### Base image
Used base image [elegoev/ubuntu-18.04-docker](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04-docker)

### Automatic provisioning
The base image is provisioned with bash script [ubuntu-18.04-k3d.sh](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/blob/master/provisioning/ubuntu-18.04-k3d.sh)

### References
- [k3d github](https://github.com/rancher/k3d)
- [manage k3s clusters with k3d](https://felixwiedmann.de/k3d-manage-k3s-clusters/)

### Configuration
#### Required Vagrant Plugins
- vagrant-disksize
- vagrant-hosts
- vagrant-secret
- vagrant-share
- vagrant-vbguest
- vagrant-vmware-esxi

###  Create Vagrant Box Environment
#### Provider "virtualbox"
1. Create directory `mkdir "name of directory"`
1. Goto directory `cd "name of directory"`
1. Create Vagrantfile `vagrant init "elegoev/ubuntu-18.04-k3d"`
1. Start vagrant box `vagrant up`

#### Provider "vmware_esxi"
1. Create directory `mkdir "name of directory"`
1. Goto directory `cd "name of directory"`
1. Download basebox `vagrant box add "elegoev/ubuntu-18.04-k3d" --provider vmware_esxi`
1. Create [Vagrantfile](https://github.com/elegoev/vagrant-ubuntu-18.04-images/blob/master/jenkins/vagrant/Vagrantfile.tpl)
1. Create file [`metadata.json`](https://github.com/elegoev/vagrant-ubuntu-18.04-images/blob/master/jenkins/vagrant/metadata.json.tpl)
1. Copy and edit [`box.json`](https://github.com/elegoev/vagrant-ubuntu-18.04-images/blob/master/jenkins/vagrant/box.json)
1. Start vagrant box `vagrant up --provider vmware_esxi`

### Versioning
Repository follows sematic versioning  [![](https://img.shields.io/badge/semver-2.0.0-green.svg)](http://semver.org)

### Changelog
For all notable changes see [CHANGELOG](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/blob/master/CHANGELOG.md)

### License
Licensed under The MIT License (MIT) - for the full copyright and license information, please view the [LICENSE](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/blob/master/LICENSE) file.

### Issue Reporting
Any and all feedback is welcome.  Please let me know of any issues you may find in the bug tracker on github. You can find it [here. ](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/issues)
