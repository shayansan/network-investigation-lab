# Phase 9 — Periodic / Beacon-like Traffic Analysis

## Objective

The goal of this phase was to generate and analyze repeated network connections occurring at regular time intervals.

## Lab Setup

Client:
- IP: 192.168.50.10

Server:
- IP: 192.168.50.20
- TCP Port: 8080

The client generated repeated HTTP connections every three seconds.

## Observed Connections

Example connection start times:

- 11:12:08.378042
- 11:12:11.432895
- 11:12:14.492030

The interval between connection attempts was approximately three seconds.

## Traffic Pattern

The following characteristics remained consistent:

- Source IP: 192.168.50.10
- Destination IP: 192.168.50.20
- Destination Port: 8080

The source port changed for each new TCP connection because a new ephemeral port was selected.

Example source ports:

- 40684
- 40686
- 40698

## Periodic Behavior

The traffic showed a regular repeating pattern:

Client
→ TCP connection
→ HTTP request
→ HTTP response
→ Connection termination
→ Wait approximately 3 seconds
→ Repeat

## Blue Team Relevance

Repeated connections to the same destination at regular intervals can resemble beaconing behavior.

Similar patterns may be observed in:

- Command-and-control communication
- Malware beaconing
- Monitoring agents
- Health checks
- Automated update services
- Legitimate scheduled applications

Periodic traffic alone does not prove malicious activity.

Additional context and correlation are required before classifying the behavior as suspicious or malicious.

## Detection Indicators

Useful characteristics for identifying periodic traffic include:

- Same source IP
- Same destination IP
- Same destination port
- Similar request pattern
- Repeating time interval
- New ephemeral source ports

## Tools Used

- tcpdump
- curl
- Python HTTP server
- Linux network namespaces

## Skills Practiced

- TCP flow identification
- Connection boundary identification
- Timestamp analysis
- Ephemeral port analysis
- Periodic traffic recognition
- Basic beacon-like behavior analysis

## Phase Status

Completed
