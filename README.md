# Zynq DMA to UDP Ethernet Tx Example

## Overview

This project demonstrates high-throughput data transmission on a Zynq SoC PL to PS ethernet using AXI DMA and UDP sockets. Data is streamed from the Programmable Logic (PL) to the Processing System (PS) via AXI DMA, and then sent over Ethernet using a UDP socket implemented with FreeRTOS and lwIP.

---

## Features

- **AXI DMA** in **Simple Mode** transfers data from PL to DDR.
- **32-bit AXI Stream data**, with a **ramp generator** in PL.
- **TLAST asserted every 4096 samples**  
  → results in **16 KB DMA transfers** (4096 × 4 bytes).
- On the PS side:
  - Uses **FreeRTOS + lwIP (RAW API)** with **UDP sockets**.
  - Based on Xilinx's `lwip_raw_socket` example.
- **Trigger mechanism**: A **single 16-byte UDP packet** received by the PS acts as a start signal.
- **After the trigger**, the system enters **continuous DMA + Ethernet transmission**, streaming 16 KB packets back-to-back.

---

## Performance

- **Tested throughput**: Up to **750 Mbps** on a Zynq-7000 platform.
- **Xilinx documentation** states up to **950 Mbps** is achievable.
- **Optimization suggestions**:
  - Use **interrupt-based DMA** instead of polling.
  - Tune **DMA transfer sizes** and align to Ethernet MTU.
  - Switch to **scatter-gather DMA** for ring-buffer streaming.

---

## UDP Networking

- **DHCP is enabled by default.**
- To disable DHCP and use a static IP:
  ```c
  #define LWIP_DHCP 0
