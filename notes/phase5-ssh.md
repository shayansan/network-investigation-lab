# Phase 5 — SSH Traffic Analysis

## Objective

The goal of this phase was to generate and analyze SSH traffic in the controlled network namespace lab.

## Lab Setup

Client:
- IP: 192.168.50.10

Server:
- IP: 192.168.50.20
- SSH Port: 22

## TCP Connection

The client initiated the connection from an ephemeral source port to TCP port 22 on the server.

Observed TCP handshake:

1. SYN
2. SYN-ACK
3. ACK

The handshake completed successfully.

## SSH Traffic

After the TCP connection was established, SSH application data was exchanged.

Unlike plaintext HTTP traffic, the SSH session payload was encrypted and the commands executed inside the session were not directly readable from the packet capture.

## Connection Termination

The SSH connection was closed gracefully using FIN packets.

## Observed Flow

Client:

192.168.50.10:42880

Server:

192.168.50.20:22

Transport Protocol:

TCP

Application Protocol:

SSH

Payload:

Encrypted

Connection Termination:

FIN

## Tools Used

- tcpdump
- OpenSSH
- Linux network namespaces

## Skills Practiced

- SSH traffic identification
- TCP three-way handshake analysis
- Ephemeral port identification
- Encrypted application traffic analysis
- TCP connection termination analysis

## Phase Status

Completed
