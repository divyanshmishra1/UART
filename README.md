
# UART Full Implementation

## 1. Introduction

This project focuses on the **design and full implementation of a Universal Asynchronous Receiver and Transmitter (UART)** using **Verilog HDL**.
The UART is a fundamental serial communication interface used to transmit and receive data between digital systems.
The main objective of this project is to **design, implement, and verify a reliable UART module** that can handle data transmission accurately, with optional extensions such as FIFO buffering, parity/error detection, and a complete RTL-to-GDSII backend flow.

---

## 2. Objectives

* Design a complete UART module including **Transmitter (TX)**, **Receiver (RX)**, and **Baud Rate Generator**.
* Develop a **self-checking verification environment** to validate the UART operation.
* Explore optional enhancements like **FIFO buffering**, **parity generation/checking**, and **error detection**.
* Optionally implement the **RTL-to-GDSII flow**, including synthesis, STA, P&R, and layout generation.

---

## 3. System Architecture

The UART system is composed of four key modules that work together to enable serial data communication.

### 3.1 Baud Rate Generator

* Generates timing pulses required for transmission and reception.
* Supports configurable baud rates to adapt to various system clock frequencies.

### 3.2 Transmitter (TX)

* Converts parallel input data to serial output stream.
* Appends **start bit**, **data bits**, **optional parity bit**, and **stop bit(s)**.
* Handles data framing and ensures accurate bit timing.

### 3.3 Receiver (RX)

* Samples the serial data and reconstructs it into parallel form.
* Detects **start**, **data**, **parity**, and **stop** bits.
* Identifies and flags **framing** or **parity errors** when applicable.

### 3.4 Top-Level UART Module

* Integrates the TX, RX, and Baud Generator modules.
* Provides a unified interface for seamless system integration.

---

## 4. BPMN Flowchart

The overall project workflow is represented using **BPMN (Business Process Model and Notation)**, illustrating each phase of the UART design and verification process.

**Figure 1:** UART Project Workflow (BPMN)

![UART BPMN Flowchart](Images/BPMN.png.png)

---

## 5. Verification Strategy

Verification ensures the correctness and robustness of the UART design.
A **self-checking testbench** is used to validate functionality under different conditions and data patterns.

### Verification Features:

* Automated comparison of transmitted and received data.
* Testing across multiple baud rates and data lengths.
* Verification of error handling mechanisms.
* Coverage of critical corner cases such as:

  * Back-to-back frame transmissions.
  * Invalid parity configurations.
  * Missing or incorrect stop bits.

---

## 6. RTL-to-GDSII Flow (Optional)

If time and resources permit, the project can be extended to a complete physical design flow involving:

1. **Logic Synthesis** – Converting RTL to a gate-level netlist (using Yosys or Design Compiler).
2. **Static Timing Analysis (STA)** – Ensuring timing closure (using OpenSTA or PrimeTime).
3. **Place & Route (P&R)** – Implementing the physical layout (using OpenROAD or Cadence Innovus).
4. **GDS-II Generation** – Producing the final layout file for fabrication.
5. **Power Optimization** – Applying low-power techniques such as **clock gating**.

---

## 7. Tools and Environment

| Category      | Tool / Software                       |
| ------------- | ------------------------------------- |
| HDL Design    | Verilog                               |
| Simulation    | ModelSim / QuestaSim / Icarus Verilog |
| Synthesis     | Yosys / Synopsys Design Compiler      |
| P&R           | OpenROAD / Cadence Innovus            |
| STA           | OpenSTA / PrimeTime                   |
| Documentation | Markdown / WaveDrom                   |

---

## 8. Future Scope

* Add **interrupt-driven UART communication** for real-time applications.
* Introduce **configurable word length**, **stop bits**, and **parity modes**.
* Implement **AXI/APB interface** for SoC-level integration.
* Incorporate **low-power design methodologies** and **power gating**.

---

## 9. Conclusion

This project successfully implements a fully functional UART communication core in Verilog HDL.
Through systematic design and verification, the UART demonstrates accurate serial communication and robustness against protocol violations.
Optional backend flow exploration provides valuable insight into ASIC implementation.

---