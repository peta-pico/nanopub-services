#!/bin/bash
#
# It's recommended to run
#   $ docker-compose stop
# before, and
#   $ docker compose start
# after running this script.

sudo tar -zcvf data/mongodb.tar.gz data/mongodb
sudo tar -zcvf data/virtuoso.tar.gz data/virtuoso
