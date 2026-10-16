# Phase 2 — TCP and HTTP Analysis

## Objective

The goal of this phase was to generate and analyze a complete TCP connection carrying HTTP traffic.

## Lab Setup

Client:
- IP: 192.168.50.10/24

Server:
- IP: 192.168.50.20/24
- HTTP service port: 8080

The HTTP server was started with:

```bash
python3 -m http.server 8080
