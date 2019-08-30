#!/usr/bin/env bash

#install for debian strech
apt-get install dirmngr && \
#trick to update locale
locale-gen en_GB.UTF-8 && \
localedef -i en_GB -f UTF-8 en_GB.UTF-8 && \

###################
#Install MongoDB4#
###################

#Install mongo 4.0.X
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
apt-get update && \
apt-get install -y mongodb-org=4.0.3 mongodb-org-server=4.0.3 mongodb-org-shell=4.0.3 mongodb-org-mongos=4.0.3 mongodb-org-tools=4.0.3 && \
#bindIp should be listen at 0.0.0.0 just for dev purpose
sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf && \
#restart mongod
systemctl enable mongod.service && \
systemctl restart mongod.service && \
echo "mongodb restarted"
