# Phase 8 — Basic Port Scan Observation

## Objective

The goal of this phase was to observe how a basic TCP connect scan appears in network traffic from a Blue Team perspective.

## Lab Setup

Client:
- IP: 192.168.50.10

Server:
- IP: 192.168.50.20

Scanned TCP ports:
- 22
- 80
- 443
- 8080
- 9999

## Nmap Scan

The client performed a TCP connect scan using:

```bash
nmap -n -Pn -sT -p 22,80,443,8080,9999 192.168.50.20
