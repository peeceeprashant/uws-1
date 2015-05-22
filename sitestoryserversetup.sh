#!/bin/bash
ARCHIVE_DIR=ephemeral
sudo yum -y install httpd httpd-devel gcc git curl-devel apr-devel openssl-devel java
sudo mkdir /home/zhiwuxie/development
cd development
sudo git clone https://github.com/peeceeprashant/UWS.git
sudo git clone https://github.com/peeceeprashant/SiteStory.git
cd UWS
sudo cp apache-tomcat-6.0.41.tar.gz ../
cd ..
sudo tar -xvf apache-tomcat-6.0.41.tar.gz
cd apache-tomcat-6.0.41/webapps/
sudo cp /home/zhiwuxie/development/SiteStory/sitestory-webapp/target/sitestory.war .
cd ..
sudo bin/shutdown.sh
sudo bin/startup.sh
#Changing archive directory 
sudo sed -i "s/backup/$ARCHIVE_DIR/g" /home/zhiwuxie/development/apache-tomcat-6.0.41/webapps/sitestory/WEB-INF/classes/ta.properties
#Restarting Tomcat
sudo bin/shutdown.sh
sudo bin/startup.sh