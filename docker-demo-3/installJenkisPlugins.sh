#!/bin/bash
terraform output jenkins > jenkins
JENKINS_IP=$(cat "jenkins") 
sudo ssh -o "StrictHostKeyChecking no" -i mykey ubuntu@$JENKINS_IP <<'ENDSSH'
sudo su - jenkins
CRUMB=$(curl -s 'http://admin:admin@localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl -X POST -H "$CRUMB" -d "<jenkins><install plugin=\"job-dsl@1.63\" /> <install plugin=\"parameterized-trigger@2.33\" /> </jenkins>"  http://admin:admin@localhost:8080/pluginManager/installNecessaryPlugins
ENDSSH
