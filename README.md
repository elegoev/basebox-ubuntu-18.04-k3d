# ubuntu-18.04-k3d

Vagrant Box with Ubuntu 18.04 and k3d

## Base image

Used base image [elegoev/ubuntu-18.04-docker](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04-docker)

## Directory Description

| directory | description                                          |
|-----------|------------------------------------------------------|
| inspec    | inspec test profiles with controls                   |
| packer    | packer build, provisioner and post-processor scripts |
| test      | test environment for provision & inspec development  |

## Vagrant

### Vagrant Cloud

- [elegoev/ubuntu-18.04-k3d](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04-k3d)

### Vagrant Plugins

- [vagrant-disksize](https://github.com/sprotheroe/vagrant-disksize)
- [vagrant-hosts](https://github.com/oscar-stack/vagrant-hosts)
- [vagrant-secret](https://github.com/tcnksm/vagrant-secret)
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)
- [vagrant-serverspec](https://github.com/vvchik/vagrant-serverspec)
- [vagrant-vmware-esxi](https://github.com/josenk/vagrant-vmware-esxi)

### Vagrantfile

    Vagrant.configure("2") do |config|

      ENV['VAGRANT_EXPERIMENTAL'] = "disks"

      $basebox_name="ubuntu-18.04-k3d-test"
      $basebox_hostname="ubuntu-1804-k3d-test"
      $src_image_name="elegoev/ubuntu-18.04-k3d"
      $vb_group_name="basebox-k3d-test"

      config.vm.define "#{$basebox_name}" do |machine|
        machine.vm.box = "#{$src_image_name}"
    
        # define guest hostname
        machine.vm.hostname = "#{$basebox_hostname}"

        machine.vm.provider "virtualbox" do |vb|
          vb.name = $basebox_name
          vb.cpus = 1
          vb.customize ["modifyvm", :id, "--memory", "1024" ]
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
          vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
          vb.customize [
            "modifyvm", :id, "--uartmode1", "file",
            File.join(Dir.pwd, "ubuntu-bionic-18.04-cloudimg-console.log")
          ]
          vb.customize ["modifyvm", :id, "--groups", "/#{$vb_group_name}" ]
          vb.customize ["modifyvm", :id, "--vram", 256 ]
        end

        machine.vm.disk :disk, size: "40GB", primary: true

      end   

    end

## K3D

### Help

    k3d --help

### Referenzen

- [k3d github](https://github.com/rancher/k3d)
- [Manage k3s clusters with k3d](https://felixwiedmann.de/k3d-manage-k3s-clusters/)
- [k3d demo](https://github.com/iwilltry42/k3d-demo)
- [Simplifying Your Cloud-Native Development Workflow With K3s, K3c and K3d](https://www.youtube.com/watch?v=hMr3prm9gDM&list=WL&index=3)
- [Set up K3s in High Availability using k3d](https://rancher.com/blog/2020/set-up-k3s-high-availability-using-k3d/)
- [k3d: Local Development with K3s Made Easy](https://www.youtube.com/watch?utm_campaign=Online+Meetup&utm_medium=email&_hsmi=110066728&_hsenc=p2ANqtz-_sn7FT74NBepGO9CzTfIghiNUx6KeUktO9EfmexrxpME1DqHQbssSCiKC296_yrViGd-gy-BMpHeNnQr3azCshnoS0WA&utm_content=110066728&utm_source=hs_email&v=d9JRb4fk5ag&feature=youtu.be)
- [k3x](https://github.com/inercia/k3x)
- [k3x: Eine grafische k3d-Oberfläche zum Verwalten von Kubernetes](https://blog.desdelinux.net/de/k3x-una-interfaz-grafica-de-k3d-para-el-manejo-de-kubernetes/)

## Versioning

Repository follows sematic versioning  [![semantic versioning](https://img.shields.io/badge/semver-2.0.0-green.svg)](http://semver.org)

## Changelog

For all notable changes see [CHANGELOG](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/blob/master/CHANGELOG.md)

## License

Licensed under The MIT License (MIT) - for the full copyright and license information, please view the [LICENSE](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/blob/master/LICENSE) file.

## Issue Reporting

Any and all feedback is welcome.  Please let me know of any issues you may find in the bug tracker on github. You can find it [here.](https://github.com/elegoev/basebox-ubuntu-18.04-k3d/issues)
