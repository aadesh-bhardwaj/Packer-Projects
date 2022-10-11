#!/bin/bash
# Wordpress
sudo apt update
sudo apt install nginx -y
sudo apt install php-fpm -y
sudo apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y
sudo mkdir /var/www/wordpress/
sudo cd /tmp
sudo curl -LO https://wordpress.org/latest.tar.gz
sudo tar xzvf latest.tar.gz
sudo cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress

# AmazonCloudWatchAgent
sudo apt update -y
sudo mkdir /tmp/cwa
cd /tmp/cwa
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip -O AmazonCloudWatchAgent.zip
sudo apt-get install -y unzip
sudo unzip -o AmazonCloudWatchAgent.zip
sudo ./install.sh

#AmazonCodeDeploy
sudo apt update -y
sudo apt install ruby wget -y
cd /home/ubuntu
wget https://aws-codedeploy-ca-central-1.s3.ca-central-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto