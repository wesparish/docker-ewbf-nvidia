#!/bin/bash

HOSTNAME=$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)
HOSTNAME=${HOSTNAME:-localhost}

export HOSTNAME

export SERVER=${SERVER:-zec-us-east1.nanopool.org}
export USER=${USER:-t1QwLHE4p5G1yM6mHk4gHUAiFVpkeZsdsUJ.$HOSTNAME}
export PORT=${PORT:-6666}

env

# ./miner --server zec-us-east1.nanopool.org --user t1QwLHE4p5G1yM6mHk4gHUAiFVpkeZsdsUJ.nv3 --pass z --port 6666
echo "Miner command: ./miner --server $SERVER --user $USER --pass z --port $PORT $@"
exec ./miner --server $SERVER --user $USER --pass z --port $PORT "$@"

