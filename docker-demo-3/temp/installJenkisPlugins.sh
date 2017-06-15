#!/bin/bash
sudo scp -i mykey ./install_jenkins_plugin.sh ubuntu@54.86.241.55:./
sudo ssh -o "StrictHostKeyChecking no" -i mykey ubuntu@54.86.241.55 <<'ENDSSH'
mv install_jenkins_plugin.sh /tmp/
sudo su - jenkins
cd /tmp/
./install_jenkins_plugin.sh -d ./plugins -a job-dsl@1.63 parameterized-trigger@2.33
ENDSSH