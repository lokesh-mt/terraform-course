#!/bin/bash
terraform output jenkins > jenkins
JENKINS_IP=$(cat "jenkins") 
sudo ssh -o "StrictHostKeyChecking no" -i mykey ubuntu@$JENKINS_IP <<'ENDSSH'
	sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get -y upgrade
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections 
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
    sudo apt-get -y install oracle-java8-installer
    sudo apt-get install oracle-java8-set-default
ENDSSH