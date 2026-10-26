# Phase 7 — Routing and Gateway Analysis

## Objective

The goal of this phase was to analyze how the client reaches a destination on the same subnet and determine whether a default gateway is required.

## Lab Setup

Client:
- IP: 192.168.50.10/24
- Interface: veth-client

Destination:
- IP: 192.168.50.20/24

## Route Analysis

The client route to the destination was checked using:

```bash
ip route
ip route get 192.168.50.20
