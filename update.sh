#!/bin/bash

set -e

echo "Shutting down the nanopub-server, to stop loading new nanopublications..."
docker-compose stop server
echo "Making a Virtuoso checkpoint..."
docker-compose exec virtuoso isql-v EXEC=checkpoint
echo "Removing Virtuoso transaction log (which should be empty now)..."
docker-compose exec virtuoso rm -f /data/virtuoso.trx
echo "Waiting 5 seconds"
sleep 5s
echo "Stopping all containers..."
docker-compose down
echo "Pulling updates to this repo..."
git pull
echo "Pulling new Docker images..."
docker-compose pull
echo "Starting up all Docker containers again..."
docker-compose up -d

echo "Successfully updated"
