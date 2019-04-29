#!/bin/bash

DATE=$(date +%Y%m%d)

mkdir -p images/$DATE

docker save nanopub/mongo | gzip -c > images/$DATE/nanopub-mongo.tar.gz
docker save nanopub/server | gzip -c > images/$DATE/nanopub-server.tar.gz
docker save nanopub/rdfsink | gzip -c > images/$DATE/nanopub-rdfsink.tar.gz
docker save nanopub/virtuoso | gzip -c > images/$DATE/nanopub-virtuoso.tar.gz
docker save nanopub/grlc | gzip -c > images/$DATE/nanopub-grlc.tar.gz
docker save nanopub/nginx | gzip -c > images/$DATE/nanopub-nginx.tar.gz
docker save nanopub/ldf | gzip -c > images/$DATE/nanopub-ldf.tar.gz
