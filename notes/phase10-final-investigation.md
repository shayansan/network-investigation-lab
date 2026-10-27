# Phase 10 — Final PCAP Investigation

## Objective

The goal of this phase was to analyze a mixed network traffic capture and identify normal communication patterns, open and closed ports, scanning activity, HTTP traffic, and periodic beacon-like behavior.

## Network Participants

Client:
- IP: 192.168.50.10

Server:
- IP: 192.168.50.20

## Protocols Observed

The capture contained multiple network protocols, including:

- ARP
- IPv4
- IPv6
- ICMP
- ICMPv6
- TCP
- HTTP

## ICMP Analysis

ICMP Echo Request and Echo Reply packets were observed between the client and server.

Example:

- 192.168.50.10 → 192.168.50.20: ICMP Echo Request
- 192.168.50.20 → 192.168.50.10: ICMP Echo Reply

This confirmed successful IP connectivity between the two hosts.

## DNS Analysis

No DNS packets were present in the final PCAP.

Therefore:

- DNS Query: Not observed
- Query Name: N/A
- Query Type: N/A
- DNS Server: N/A
- Returned IP: N/A

## TCP Port Analysis

TCP port 8080 was identified as open.

The following TCP three-way handshake was observed:

1. SYN
2. SYN-ACK
3. ACK

Several other ports were identified as closed:

- 22/tcp
- 80/tcp
- 443/tcp
- 9999/tcp

Closed ports responded to connection attempts with RST-ACK packets.

## HTTP Analysis

HTTP traffic was observed over TCP port 8080.

Observed request:

- Method: GET
- Destination Port: 8080

Observed response:

- HTTP/1.0 200 OK

The HTTP traffic was transmitted in plaintext and could therefore be directly identified in the packet capture.

## Port Scan Observation

The client attempted TCP connections to multiple destination ports on the same server within a very short period.

Ports tested included:

- 22
- 80
- 443
- 8080
- 9999

This traffic pattern is consistent with basic TCP port scanning behavior.

## Periodic / Beacon-like Traffic

Repeated HTTP connections were observed from:

- Source: 192.168.50.10
- Destination: 192.168.50.20
- Destination Port: 8080

Example connection start times:

- 11:20:43.406928
- 11:20:46.464211
- 11:20:49.516020
- 11:20:52.560428

The connections occurred approximately every three seconds.

The source ports changed between connections:

- 56200
- 56210
- 58702
- 58706

This creates a periodic traffic pattern that resembles beacon-like communication.

Periodic traffic alone does not indicate malicious activity, but it is an important pattern for Blue Team analysts to investigate and correlate with additional host and network evidence.

## Blue Team Investigation Indicators

Three important behaviors were identified:

### 1. Port Scanning Behavior

A single client attempted connections to several ports on the same destination within a very short time window.

### 2. Periodic / Beacon-like Communication

The client repeatedly contacted the same destination IP and port at approximately three-second intervals.

### 3. Repeated Plaintext HTTP Communication

Multiple HTTP requests were transmitted to TCP port 8080 and their contents were visible directly in the packet capture.

## Final Conclusion

The PCAP shows communication between client `192.168.50.10` and server `192.168.50.20`.

ICMP traffic confirmed successful connectivity between the two hosts. TCP analysis showed that port `8080` was open, while ports `22`, `80`, `443`, and `9999` were closed.

The client attempted connections to several destination ports within a very short period, producing a pattern consistent with TCP port scanning.

The capture also contained repeated HTTP connections from the client to `192.168.50.20:8080`. These connections occurred approximately every three seconds and used different ephemeral source ports, creating a periodic or beacon-like traffic pattern.

From a Blue Team perspective, the most relevant observations are the multi-port scanning behavior, repeated periodic connections, and plaintext HTTP communication. These behaviors do not independently prove malicious activity, but they represent useful indicators that should be investigated and correlated with additional network and endpoint evidence.

## Tools Used

- tcpdump
- Nmap
- curl
- ping
- Linux network namespaces
- Python HTTP server

## Skills Practiced

- PCAP investigation
- Protocol identification
- ICMP analysis
- TCP handshake analysis
- Open and closed port identification
- HTTP traffic analysis
- Port scan recognition
- Periodic traffic analysis
- Beacon-like behavior recognition
- Blue Team network investigation

## Phase Status

Completed
