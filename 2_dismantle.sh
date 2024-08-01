#!/bin/bash

# Stop HTTPD Service
echo "#################################"
echo "Stop HTTPD Service"
sudo systemctl stop httpd
echo

# Remove files
echo "#################################"
echo "Remove files from Working Directory"
sudo rm -rf /var/www/html/*
echo

# Remove dependecies 
echo "#################################"
echo "Remove dependencies"
sudo yum remove httpd wget unzip -y
echo
