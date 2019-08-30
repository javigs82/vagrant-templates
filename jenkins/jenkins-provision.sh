#!/usr/bin/env bash

#Define in vagrantfile to store Dockerfile
TMP_JENKINS="/tmp/jenkins"
cd $TMP_JENKINS

#################
#Install Jenkins#
#################

# For provision when docker image is up: stop, remove container and remove image.

# Stop jenkins container
docker stop jenkins-master

# Remove container
docker rm jenkins-master

# Remove image
docker rmi javigs82/jenkins:lts-slim

#Build jenkins docker image
docker build . -t javigs82/jenkins:lts-slim && \

#notice that /data path must exist and it should be mounted on external device
JENKINS_HOME_HOST=/data/jenkins/jenkins_home && \
JENKINS_LOG_HOST=/data/jenkins/var/log/jenkins && \

mkdir -p $JENKINS_HOME_HOST && \
chown 1000 $JENKINS_HOME_HOST && \

mkdir -p $JENKINS_LOG_HOST && \
chown 1000 $JENKINS_LOG_HOST && \

docker volume create --driver local --opt device=$JENKINS_HOME_HOST \
--opt o=bind jenkins-home-volume && \

docker volume create --driver local --opt device=$JENKINS_LOG_HOST   \--opt o=bind jenkins-log-volume && \

#run jenkins: docker.sock is to work with DosD
docker run -it -d --restart unless-stopped --name jenkins-master -p 8080:8080  \
-e JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --prefix=/jenkins" \
-e JAVA_OPTS="-Xmx2048m" -v jenkins-home-volume:/var/jenkins_home:z \
-v jenkins-log-volume:/var/log/jenkins:z  \
-v /var/run/docker.sock:/var/run/docker.sock javigs82/jenkins:lts-slim
