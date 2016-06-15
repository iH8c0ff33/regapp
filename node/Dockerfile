FROM alpine
MAINTAINER Daniele Monteleone <daniele.monteleone.it@gmail.com>

RUN apk add --update nodejs && \
  mkdir -p /tmp/node
ADD src/package.json /tmp/node/package.json
WORKDIR /tmp/node
RUN npm install
RUN mkdir -p /src && \
  cp -a /tmp/node/node_modules /src/ && \
  rm -rf /tmp/node

WORKDIR /src
ADD src /src

CMD node /src/app.js
