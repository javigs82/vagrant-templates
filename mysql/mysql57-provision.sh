#!/bin/bash
# Description: Set up MySQL Community Release 5.7

# Get the repo RPM and install it.
yum -y localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm && \
yum -y install mysql-community-server && \

#disable only for development purposes
systemctl start mysqld && \

echo "validate_password=OFF" >> /etc/my.cnf && \

systemctl restart mysqld && \

# Get the temporary password
TEMP_PASSWORD=$(grep "temporary password" /var/log/mysqld.log | awk '{print $NF}')

# Set up a batch file with the SQL commands
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY ''; \
FLUSH PRIVILEGES; UPDATE  mysql.user SET host='%' \
WHERE user='root' AND host='localhost'; GRANT ALL PRIVILEGES ON *.* TO root@'%'; \
FLUSH PRIVILEGES;" > reset_pass.sql

# Log in to the server with the temporary password, and pass the SQL file to it.
mysql -u root --password=$TEMP_PASSWORD --connect-expired-password  < reset_pass.sql
