# Phase 3 — Open vs Closed TCP Ports

## Objective

The goal of this phase was to compare the TCP behavior of an open port and a closed port.

## Lab Setup

Client:
- IP: 192.168.50.10

Server:
- IP: 192.168.50.20

Tested ports:
- TCP 8080
- TCP 9999

## Open Port Analysis

Port 8080 responded with:

1. SYN
2. SYN-ACK
3. ACK

The TCP three-way handshake completed successfully.

The client then sent an HTTP request and the server returned:

HTTP/1.0 200 OK

Result:

Port 8080 was open and an HTTP service was listening.

## Closed Port Analysis

Port 9999 responded with:

1. SYN
2. RST-ACK

The TCP handshake did not complete.

Result:

Port 9999 was closed and no service was listening.

## Key Difference

Open port:

SYN → SYN-ACK → ACK

Closed port:

SYN → RST-ACK

## Tools Used

- tcpdump
- curl
- Python HTTP server
- Linux network namespaces

## Phase Status

Completed
