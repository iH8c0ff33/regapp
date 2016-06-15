#!/bin/sh
cd /var/regapp/app
bower install
polymer build
rm -rf /var/regapp/public
cp -a /var/regapp/app/build/bundled /var/regapp/public
docker build -t regapp_node_image /var/regapp/node
docker build -t regapp_db_image /var/regapp/db
docker kill regapp_db
docker rm regapp_db
docker create \
    -i -t \
    --net regapp_network \
    --name regapp_db \
    regapp_db_image
docker create \
    -i -t \
    --net regapp_network \
    --name regapp_node \
    --link regapp_db:database \
    regapp_node_image
docker start regapp_db
docker start regapp_node
docker run -i -t -d --name regapp --net regapp_network regapp_image
