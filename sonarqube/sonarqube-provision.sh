#!/usr/bin/env bash

################################################
#Install Sonar & PostgresSQL via docker-compose#
################################################
TMP_SONAR="/tmp/sonarque"
cd $TMP_SONAR
#notice that /data path must exist and it should be mounted on external device
SONAR_HOME_HOST=/data/sonarqube/sonarqube_home && \
DB_HOME_HOST=/data/postgres/postgres_home && \

mkdir -p $SONAR_HOME_HOST && \
chown 1000 $SONAR_HOME_HOST && \

mkdir -p $DB_HOME_HOST && \
chown 1000 $DB_HOME_HOST && \


#run docker compose

docker-compose up -d && \

echo "running sonar"
