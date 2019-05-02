Nanopub Services
================

The nanopub services are a collection of Docker containers that include a
nanopub server, a query/API service based on Virtuoso and grlc, and a Linked
Data Fragments server.


## Setup

The nanopublication services can be setup by following these four steps.


### Step 1: Clone this repository

Clone this repository in the server where you want to deploy the nanopub
services:

    $ git clone https://github.com/peta-pico/nanopub-services.git
    $ cd nanopub-services


### Step 2: Setup the data directory

The data will be stored in a directory called `data` in your `nanopub-services`
directory (around 32 GB, and growing). If the data should be stored somewhere
else, e.g. because of performance or space reasons, you should make a symbolic
link like this (run this and the following commands in the `nanopub-services`
directory):

    $ ln -s /location/where/data/should/be/stored data

These services will automatically sync with the network, but to speed things up,
you can download and extract pre-built database packages:

    $ wget https://zenodo.org/record/2656547/files/mongodb0.tar.gz
    $ tar -xvzf mongodb0.tar.gz && rm mongodb0.tar.gz

    $ wget https://zenodo.org/record/2656547/files/virtuoso.tar.gz
    $ tar -xvzf virtuoso.tar.gz && rm virtuoso.tar.gz


### Step 3: Configure web server and services

Configure your web server to forward three subdomains to the three public-facing
nanopub services `server`, `grlc`, and `ldf`. An example for nginx can be found
[here](nginx-config-template.txt). Replace `YOUR.SERVER.DOMAIN` with your actual
server domain (e.g. `example.com` or `mygroup.example.com`).

The services themselves also need some small configuration. For that, make a
copy of the docker-compose.override template:

    $ cp docker-compose.override.yml.template docker-compose.override.yml

In the file `docker-compose.override.yml` replace
`http://server.np.YOUR.SERVER.DOMAIN` with the actual URL for the `server`
container on your web server (e.g. `http://server.np.example.com/`), and
similarly with `http://ldf.np.YOUR.SERVER.DOMAIN/` for the `ldf` container.
These URLs need to end with a slash `/`, and they need to match the domains
defined above.

(If you need to do any other changes to the configuration found in
`docker-compose.yml`, just add them to the file `docker-compose.override.yml`.
Directly editing `docker-compose.yml` can lead to problems when updating.)


### Step 4: Start services

Now you should be able to start the services with Docker Compose:

    $ docker-compose up -d

You should now be able to access the services via the subdomains defined above
(you might have to restart your web server, e.g. with `sudo service nginx
restart`).


## Updating

Run this to update the services:

    $ ./update.sh

This will shutdown the services, update everything, and start them up again. If
you see the message "Successfully updated" in the end, then probably everything
went well.
