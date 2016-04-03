#!/bin/sh
#docker network rm my-bridge-network
#docker network create -d bridge --subnet=172.18.0.0/16 -o com.docker.network.bridge.enable_icc=true -o com.docker.network.bridge.enable_ip_masquerade=true -o com.docker.network.bridge.host_binding_ipv4=0.0.0.0 -o com.docker.network.bridge.name=docker1 -o com.docker.network.driver.mtu=1500 my-bridge-network
