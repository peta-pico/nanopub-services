#!/bin/bash

mkdir -p images

docker save nanopub/mongo | gzip -c > images/nanopub-mongo.tar.gz
docker save nanopub/server | gzip -c > images/nanopub-server.tar.gz
docker save nanopub/rdfsink | gzip -c > images/nanopub-rdfsink.tar.gz
docker save nanopub/virtuoso | gzip -c > images/nanopub-virtuoso.tar.gz
docker save nanopub/grlc | gzip -c > images/nanopub-grlc.tar.gz
docker save nanopub/nginx | gzip -c > images/nanopub-nginx.tar.gz
docker save nanopub/ldf | gzip -c > images/nanopub-ldf.tar.gz
