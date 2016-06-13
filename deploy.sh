#!/bin/sh
docker rmi regapp_image
cd /var/regapp/app
bower install
polymer build
cp -a /var/regapp/app/build/unbundled /var/regapp/public
docker build --force-rm -t regapp_image /var/regapp
docker network create regapp_network
docker kill regapp
docker rm regapp
docker run -i -t -d --name regapp --net regapp_network regapp_image
