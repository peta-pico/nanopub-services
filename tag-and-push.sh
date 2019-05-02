#!/bin/bash

DATE=$(date +%Y%m%d)

docker tag nanopub/mongo nanopub/mongo:$DATE
docker tag nanopub/server nanopub/server:$DATE
docker tag nanopub/rdfsink nanopub/rdfsink:$DATE
docker tag nanopub/virtuoso nanopub/virtuoso:$DATE
docker tag nanopub/grlc nanopub/grlc:$DATE
docker tag nanopub/nginx nanopub/nginx:$DATE
docker tag nanopub/ldf nanopub/ldf:$DATE

docker push nanopub/mongo:$DATE
docker push nanopub/server:$DATE
docker push nanopub/rdfsink:$DATE
docker push nanopub/virtuoso:$DATE
docker push nanopub/grlc:$DATE
docker push nanopub/nginx:$DATE
docker push nanopub/ldf:$DATE

docker push nanopub/mongo
docker push nanopub/server
docker push nanopub/rdfsink
docker push nanopub/virtuoso
docker push nanopub/grlc
docker push nanopub/nginx
docker push nanopub/ldf
