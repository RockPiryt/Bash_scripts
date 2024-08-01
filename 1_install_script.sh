#! /bin/bash

# Variable Declaration

PACKAGE="httpd wget unzip"
SVC="httpd"
URL=''
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "###########################################"
echo "Intalling packages"
sudo yum install $PACKAGE" -y & > /dev/null
echo "###########################################"
echo

# Start & Enable Service
echo "###########################################"
echo "Start & Enable HTTPD Service"
echo "###########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "###########################################"
echo "Creating new directory"
echo "###########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL >/dev/null
unzip $ART_NAME>/dev/null
sudo cp -r $ART_NAME/* /var/www/html

# Bounce Service
echo "###########################################"
echo "Restarting HTTPD Service"
echo "###########################################"
sudo systemctl restart $SVC
echo

# Clean Up
echo "###########################################"
echo "Removing Temporary Files"
echo "###########################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
# ls /var/www/html/
