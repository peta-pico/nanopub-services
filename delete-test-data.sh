#!/bin/bash

# For testing environment, you can add a symbolic link from test-data to data:
#
# $ ln -s data test-data
#
# And then you can use this script the delete the test data and start afresh.

sudo rm -rf ./test-data/mongodb
sudo rm -rf ./test-data/rdfsink
sudo rm -rf ./test-data/virtuoso
