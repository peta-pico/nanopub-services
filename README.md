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
directory. If the data should be stored somewhere else (e.g. because of
performance or space reasons), you should make a symbolic link pointing to the
other location like this (run within `nanopub-services`):

    $ ln -s /location/where/data/should/be/stored data

_(TODO: add info here how to download and unpack pre-built database images)_


### Step 3: Configure web server and services

Configure your web server (e.g. nginx or Apache) to forward three subdomains to
the three public-facing nanopub services (called here `server`, `grlc`, and
`ldf`). An example for nginx can be found [here](nginx-config-template.txt).
Replace `YOUR.SERVER.DOMAIN` with your actual server domain (e.g. `example.com`
or `mygroup.example.com`).

Then we also need to configure our services. Make a copy of the
docker-compose.override template:

    $ cp docker-compose.override.yml.template docker-compose.override.yml

In the file `docker-compose.override.yml` replace
`http://server.np.YOUR.SERVER.DOMAIN` with the actual URL for the `server`
container on your web server (e.g. `http://server.np.example.com/`). This needs
to end with a slash `/`. The chosen URL has to be the same as above.

If you need to do any other changes to the configuration found in
`docker-compose.yml`, just add it to the file `docker-compose.override.yml` and
do _not_ edit `docker-compose.yml` itself (it will lead to problems with
updating).


### Step 4: Start services

Now you should be able to start the services with Docker Compose:

    $ docker-compose up -d


## Updating

Run this to update your system:

    $ ./update.sh

This will shutdown the services, update everything, and start them up again. If
you see the message "Successfully updated" in the end, then probably everything
went well.
