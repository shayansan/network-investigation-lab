# Phase 4 — DNS and UDP Analysis

## Objective

The goal of this phase was to generate and analyze DNS traffic over UDP in a controlled lab environment.

## Lab Setup

Client:
- IP: 192.168.50.10

DNS Server:
- IP: 192.168.50.20
- Port: 53

A local DNS service was configured to resolve:

lab.test → 192.168.50.20

## DNS Query

The client sent a DNS query:

Source:
192.168.50.10:39615

Destination:
192.168.50.20:53

Transport Protocol:
UDP

Query:
A? lab.test

## DNS Response

The DNS server replied:

Source:
192.168.50.20:53

Destination:
192.168.50.10:39615

Answer:
A 192.168.50.20

## Observed Flow

192.168.50.10:39615
→
192.168.50.20:53

DNS Query:
A? lab.test

192.168.50.20:53
→
192.168.50.10:39615

DNS Answer:
192.168.50.20

## Tools Used

- tcpdump
- dig
- dnsmasq
- Linux network namespaces

## Skills Practiced

- DNS query analysis
- DNS response analysis
- UDP traffic analysis
- Source and destination port identification
- A record analysis
- Client/server traffic direction analysis

## Phase Status

Completed
