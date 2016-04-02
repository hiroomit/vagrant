#!/bin/sh
docker network rm my-bridge-network
docker network create -d bridge --subnet=172.18.0.0/16 my-bridge-network

