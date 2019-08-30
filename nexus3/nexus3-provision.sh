#!/usr/bin/env bash

###################
#Install NexusOSS3#
###################

# For provision when docker image is up: stop and remove container.

# Stop nexus container
docker stop nexus

# Remove container
docker rm nexus

#notice that /data path must exist and it should be mounted on external device
NEXUS3_HOME_HOST=/data/sonatype/nexus3/nexus-data && \

mkdir -p $NEXUS3_HOME_HOST && \
chown 200 $NEXUS3_HOME_HOST && \

docker volume create --driver local --opt device=$NEXUS3_HOME_HOST --opt o=bind nexus-data && \

#run nexus
docker run -it -d --restart unless-stopped --name nexus -p 8081:8081 -p 8123:8123 -e NEXUS_CONTEXT=nexus -e INSTALL4J_ADD_VM_PARAMS="-Xms1512M -Xmx1512M" \
-v nexus-data:/nexus-data sonatype/nexus3:3.17.0 &&\

echo "nexus3 running"
