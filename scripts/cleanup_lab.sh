#!/usr/bin/env bash

sudo ip netns del client 2>/dev/null || true
sudo ip netns del server 2>/dev/null || true
