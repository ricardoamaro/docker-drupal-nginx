#!/bin/bash

if (sudo docker ps | grep docker-drupal-nginx | grep -q "80->80") ; then
	echo "*** This docker is already running on port 80 ***"
	echo "You can use 'docker stop {instance id}' to end it"
	echo ""
else
  if [ ! -f /usr/local/bin/docker ]; then  
	  sudo apt-get -y install docker
	  curl get.docker.io | sudo sh -x
  fi
  sudo docker build -t="docker-drupal-nginx" .
  sudo docker run -d -t -p 80:80 docker-drupal-nginx
fi
sudo docker ps
echo "Drupal is installed and running"
echo "Use your browser to navigate to http://localhost"


