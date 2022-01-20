# Packaging DBs

To avoid long loading times for new service sites.

## Building package

Stop server from collecting more nanopubs:

    $ docker-compose stop server

Wait a few seconds then make Virtuoso checkpoint:

    $ docker-compose exec virtuoso isql-v EXEC=checkpoint

Stop all services:

    $ docker-compose stop

Create zip files (might need sudo):

    $ tar -czvf mongodb.tar.gz data/mongodb
    $ tar --exclude=data/virtuoso/virtuoso.log --exclude=data/virtuoso/dumps --exclude=data/virtuoso/virtuoso.trx --exclude=data/virtuoso/.dba_pwd_set -czvf virtuoso.tar.gz data/virtuoso

Start the services again:

    $ docker-compose start

## Removing journal ID in MongoDB

Set up MongoDB in local empty instance of this repo:

    $ tar -xvzf mongodb.tar.gz

Remove lock files, if any (might need sudo):

    $ rm -f data/mongodb/*.lock

Run MongoDB:

    $ docker run -v $(pwd)/data/mongodb:/data/db -p 27017:27017 -d nanopub/mongo

Check journal ID:

    $ mongo --eval "db.getSiblingDB('nanopub-server').getCollection('journal').find({'_id':'journal-id'});"

Set journal ID to 0:

    $ mongo --eval "db.getSiblingDB('nanopub-server').getCollection('journal').findAndModify({'query':{'_id':'journal-id'},'update':{'_id':'journal-id','value':'0'}});"

Check again:

    $ mongo --eval "db.getSiblingDB('nanopub-server').getCollection('journal').find({'_id':'journal-id'});"

Stopping MongoDB:

    $ docker stop $(docker ps -a -q --filter ancestor=nanopub/mongo)

Remove lock files again, if any, and diagnostic data (might need sudo):

    $ rm -f data/mongodb/*.lock
    $ rm -rf data/mongodb/diagnostic.data

Making new archive (might need sudo):

    $ tar -czvf mongodb0.tar.gz data/mongodb

## Using packages

Downloading and then unzipping:

    $ tar -xvzf mongodb0.tar.gz
    $ tar -xvzf virtuoso.tar.gz

