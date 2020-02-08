# Vagrant Templates

**vagrant-templates** is a set of vagrant templates based on virtual-box and oriented to developers and operators.

## Utilities

 - **Docker Compose** (ubuntu/bionic64): Virtual machine with docker & docker compose installed. The provision script is also used in other machines.
 - MongoDB: MongoDB 4.0.x installation running in debian/stretch64.
 - MySql: Mysql5.7 installation over centos7
 - **Jenkins** (ubuntu/bionic64): Jenkins slim running in docker under debian/buster64.
 - Sonarqube:  Sonarqube installation on docker in a vagrant machine. It also install PostgreSQL in other docker container while orchestration is done via docker-compose.
 - Nexus3:  Nexus3 installation on docker in a vagrant machine running in debian/stretch64.
 - RabbitMq: Installation over [Debian](https://www.rabbitmq.com/install-debian.html)
 - MacOS- Sierra: Sierra macOS vagrant machine with GUI enabled.
 - **Terraform** (centos/7): installed via ansible role.
 - **Ansible** (centos/7): installed via ansible role.
 - **Minikube** (debian/jessie64)): installed via ansible role. Contains kubectl also.

 **Note-1:** Most of them work via vagrant port_fordwarding option.  
 **Note-2:** Most of them need docker installed, so Vagrantfiles are provisioned with docker-composed as first provisioner like

 ```
 config.vm.provision :shell, path: "./../docker-compose/docker-compose-provision.sh"

 ```

  **Note-3:** For agent fordwaring please configure your your ssh to work with.

# Getting Started

These instructions will get you a copy of the project up and building on your local machine for development and testing purposes.

To get the code:
-------------------

Clone the repository:

    $ git clone git@github.com:javigs82/vagrant-templates.git

If this is your first time using Github, review http://help.github.com to learn the basics.

## Prerequisites

What things you need to install the software and how to install them
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/downloads.html)

In order to work with virtual box and vagrant plugings, 
install following packages in your os.

Note this is an exapmple for debian/ubuntu:

```

sudo apt-get install linux-headers-$(uname -r) build-essential dkms 

```

## Jenkins

The script to obtain installed plugin for updating `plugins.txt`:

```
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("${plugin.getShortName()}:${plugin.getVersion()}")
}

```

## Minikube

In order to work with minikube in vagrant `vm-driver=none`
Please heck following link [https://minikube.sigs.k8s.io/docs/start/linux/](https://minikube.sigs.k8s.io/docs/start/linux/)

### Usage

The none driver requires minikube to be run as root, until #3760 can be addressed.

```

sudo minikube start --vm-driver=none

```

To make none the default driver:

```

sudo minikube config set vm-driver none


```

## Author

* javigs82 [github](https://github.com/javigs82/)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details

sudo yum install docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine