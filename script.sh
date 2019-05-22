#!/bin/sh

USER1=user1
USER2=user2
USER3=user3

sudo useradd -m $USER1
sudo useradd -m $USER2
sudo useradd -m $USER3

sudo chown -R $(whoami):$(whoami) /home/$USER1
sudo chown -R $(whoami):$(whoami) /home/$USER2
sudo chown -R $(whoami):$(whoami) /home/$USER3

sudo chmod -R 755 /home/$USER1
sudo chmod -R 755 /home/$USER2
sudo chmod -R 755 /home/$USER3

cp -R ./apache /home/$USER1/apache
cp -R ./apache /home/$USER2/apache
cp -R ./apache /home/$USER3/apache

sed -i 's/php:9000/php1:9000/g' /home/$USER1/apache/demo.apache.conf
sed -i 's/php:9000/php2:9000/g' /home/$USER2/apache/demo.apache.conf
sed -i 's/php:9000/php3:9000/g' /home/$USER3/apache/demo.apache.conf

cp -R ./mysql /home/$USER1/mysql
cp -R ./mysql /home/$USER2/mysql
cp -R ./mysql /home/$USER3/mysql

mkdir /home/$USER1/php
mkdir /home/$USER2/php
mkdir /home/$USER3/php

cp -R ./php/local.ini /home/$USER1/php/
cp -R ./php/local.ini /home/$USER2/php/
cp -R ./php/local.ini /home/$USER3/php/

cp -R ./public_html/ /home/$USER1/public_html/
cp -R ./public_html/ /home/$USER2/public_html/
cp -R ./public_html/ /home/$USER3/public_html/

sed -i "s/\$host = 'mysql'/\$host = 'mysql1'/g" /home/$USER1/public_html/index.php
sed -i "s/\$host = 'mysql'/\$host = 'mysql2'/g" /home/$USER2/public_html/index.php
sed -i "s/\$host = 'mysql'/\$host = 'mysql3'/g" /home/$USER3/public_html/index.php

docker-compose build
docker-compose up -d
docker restart haproxy
