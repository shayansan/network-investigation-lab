# Phase 6 — TLS and HTTPS Analysis

## Objective

The goal of this phase was to generate and analyze HTTPS traffic protected by TLS.

## Lab Setup

Client:
- IP: 192.168.50.10

Server:
- IP: 192.168.50.20
- HTTPS Port: 443

A temporary self-signed certificate was created for:

lab.test

## TCP Connection

The client initiated a TCP connection from an ephemeral source port to TCP port 443.

Observed TCP handshake:

1. SYN
2. SYN-ACK
3. ACK

The TCP connection was established successfully.

## TLS Handshake

The connection used:

- TLS Version: TLS 1.3
- Cipher Suite: TLS_AES_256_GCM_SHA384

Observed TLS handshake messages included:

- ClientHello
- ServerHello
- Certificate
- Certificate Verify
- Finished

## Certificate

Certificate Subject:

CN=lab.test

Certificate Issuer:

CN=lab.test

The certificate was self-signed.

Certificate verification was bypassed using curl with the `-k` option.

## HTTPS Traffic

The client sent:

GET /

The server responded with:

HTTP/1.0 200 OK

Unlike plaintext HTTP traffic, the HTTP request and response contents were encrypted inside TLS when observed at the packet capture level.

## Connection Termination

The TCP connection was closed gracefully using FIN packets.

## Tools Used

- tcpdump
- curl
- OpenSSL
- Linux network namespaces

## Skills Practiced

- HTTPS traffic identification
- TLS handshake analysis
- ClientHello and ServerHello identification
- Certificate inspection
- Cipher suite identification
- Encrypted application traffic analysis
- TCP connection termination analysis

## Phase Status

Completed
