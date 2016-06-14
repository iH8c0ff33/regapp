#!/bin/sh
cd /var/regapp/app
bower install
polymer build
rm -rf /var/regapp/public
cp -a /var/regapp/app/build/bundled /var/regapp/public
docker build -t regapp_image /var/regapp
docker network create regapp_network
docker kill regapp
docker rm regapp
docker run -i -t -d --name regapp --net regapp_network regapp_image
