#!/usr/bin/env bash

set -e

sudo ip netns add client
sudo ip netns add server

sudo ip link add veth-client type veth peer name veth-server

sudo ip link set veth-client netns client
sudo ip link set veth-server netns server

sudo ip netns exec client ip addr add 192.168.50.10/24 dev veth-client
sudo ip netns exec server ip addr add 192.168.50.20/24 dev veth-server

sudo ip netns exec client ip link set lo up
sudo ip netns exec client ip link set veth-client up

sudo ip netns exec server ip link set lo up
sudo ip netns exec server ip link set veth-server up
