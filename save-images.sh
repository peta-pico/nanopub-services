#!/bin/bash

mkdir -p images

docker save -o images/nanopub-mongo.tar nanopub/mongo
docker save -o images/nanopub-server.tar nanopub/server
docker save -o images/nanopub-rdfsink.tar nanopub/rdfsink
docker save -o images/nanopub-virtuoso.tar nanopub/virtuoso
docker save -o images/nanopub-grlc.tar nanopub/grlc
docker save -o images/nanopub-nginx.tar nanopub/nginx
