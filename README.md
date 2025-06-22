# Zeek OT/ICS Protocol PCAPs – Co-op Cyber Tech 2025

Welcome to the PCAP repository for the **Co-op Cyber Tech 2025** training session on **Zeek: Leveraging ACID and OT Protocols**, presented by Patrick Kelley of Léargas Security.

This repository contains a curated collection of PCAP files used in hands-on exercises during the session. These capture real-world OT/ICS protocol traffic and are designed to help analysts better understand protocol behavior, Zeek detection capabilities, and common attacker techniques in industrial environments.

---

## Directory Structure

Each subfolder contains PCAP files and relevant exercise notes (if applicable):

/enip-cip/ → Exercise 1: Rockwell/CIP Protocols
/s7comm/ → Exercise 2: Siemens S7
/bacnet/ → Exercise 3: Building Automation
/dnp3/ → Exercise 4: SCADA for Utilities
/modbus/ → Exercise 5: Classic ICS Traffic
/profinet/ → Exercise 6: High-Speed Industrial Protocols

---

## What You'll Learn

Each PCAP is aligned with specific training content, including:

- **Deep protocol inspection** using Zeek and ICSNPP analyzers
- **Tactical detections** for adversary techniques (ATT&CK for ICS)
- **How to enrich Zeek logs** with MAC addresses, geolocation, and OT tagging
- **AI/MCP integration** for explaining and alerting on ICS data in SIEM

---

## Requirements

Ensure you have the following tools to begin:

- Docker-enabled Zeek image:  
  `docker pull pkelleyls/zeek-ics:7.0.7.1`

- Zeek log output path:  
  `-v $PWD/zeek-logs:/zeek/logs`

- Required analyzers via zkg:  
  `zkg install --force https://github.com/cisagov/icsnpp-<protocol>`

- Manual load of ACID:
  ```zeek
  @load ACID/scripts

## Getting Started
Clone this repository.

Choose a protocol folder (e.g., modbus/) and analyze the PCAP using:

bash
Copy
Edit
docker run --rm -it --network=host --cap-add=NET_ADMIN --cap-add=NET_RAW \
-v $PWD/modbus:/pcap -v $PWD/zeek-logs:/zeek/logs \
pkelleyls/zeek-ics:7.0.7.1 \
zeek -r /pcap/sample.pcap
Review logs in zeek-logs/.
