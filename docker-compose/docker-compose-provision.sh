#!/usr/bin/env bash

#########################################################
####Installing Docker & Docker Compose
#########################################################
apt-get update &&\
apt-get install --assume-yes \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \


curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && \


add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \

apt-get update && \

apt-get install --assume-yes docker-ce && \

echo 'Docker installed'

echo "downloading docker-compose"

curl -fsSL https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \

chmod +x /usr/local/bin/docker-compose && \

echo 'Docker Compose installed'
