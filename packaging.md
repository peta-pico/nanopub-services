# Packaging DBs

To avoid long loading times for new service sites.

## Building package

Stop services:

    $ docker-compose stop

Create zip files (might need sudo):

    $ tar -czvf mongodb.tar.gz data/mongodb
    $ tar -czvf virtuoso.tar.gz data/virtuoso

## Removing journal ID in MongoDB

Set up MongoDB in local empty instance of this repo:

    $ tar -xvzf mongodb.tar.gz

Remove lock files:

    $ rm data/mongodb/*.lock

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

Making new archive (might need sudo):

    $ tar -czvf mongodb0.tar.gz data/mongodb

## Using packages

Downloading and then unzipping:

    $ tar -xvzf mongodb0.tar.gz
    $ tar -xvzf virtuoso.tar.gz
