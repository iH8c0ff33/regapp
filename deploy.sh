#!/bin/sh
docker rmi regapp_image
docker build -t regapp_image /var/regapp
docker network create regapp_network
docker stop regapp
docker rm regapp
docker run -i -t -d --name regapp --net regapp_network regapp_image
