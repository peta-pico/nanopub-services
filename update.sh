#!/bin/bash

docker-compose down
git pull
docker-compose pull
docker-compose up -d
