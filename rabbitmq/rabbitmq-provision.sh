#!/usr/bin/env bash

##################
#Install RabbitMQ#
##################

#Install rabbitmq
apt-key adv --keyserver "hkps.pool.sks-keyservers.net" --recv-keys "0x6B73A36E6026DFCA" && \
wget -O - "https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc" | sudo apt-key add - && \
echo "deb https://dl.bintray.com/rabbitmq/debian jessie main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list && \

apt-get install erlang-nox && \
apt-get install rabbitmq-server && \


#start 
service rabbitmq-server start && \

#create user admin
rabbitmqctl add_user admin admin

# give administrator access
rabbitmqctl set_user_tags admin administrator

# give permission
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"


#Install GUI admin
rabbitmq-plugins enable rabbitmq_management && \

echo "rabbitmq started"
