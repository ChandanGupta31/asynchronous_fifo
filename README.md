
# Parameterized Asynchronous FIFO
### RTL Design and Verification using SystemVerilog

## 1. Project Overview

This project focuses on the design and verification of a parameterized Asynchronous First-In, First-Out (FIFO) using SystemVerilog.

An asynchronous FIFO is a storage structure used to transfer data between two independent clock domains. Unlike a synchronous FIFO, its read and write operations are controlled by separate clocks that may have different frequencies and phase relationships.

The objective of this project is to understand, design, implement, simulate, verify, and synthesize an asynchronous FIFO while developing a strong understanding of RTL design and Clock Domain Crossing (CDC) techniques.

## 2. Project Objectives

- Design a parameterized asynchronous FIFO.
- Support independent read and write clock domains.
- Implement binary read and write pointers.
- Implement Gray-code pointer conversion.
- Understand and implement Clock Domain Crossing (CDC).
- Design two-flop synchronizers.
- Implement FIFO full and empty detection logic.
- Handle reset, overflow, and underflow conditions.
- Verify FIFO functionality using independent-clock testbenches.
- Analyze simulation waveforms and debug design issues.
- Perform synthesis and evaluate hardware implications.

## 3. Target Architecture

The asynchronous FIFO will consist of the following functional blocks:

1. FIFO Memory
2. Binary Write Pointer
3. Binary Read Pointer
4. Binary-to-Gray Code Conversion
5. Gray-Code Pointer Synchronizers
6. Full Detection Logic
7. Empty Detection Logic
8. Top-Level Asynchronous FIFO Module

### Clock Domains

**Write Clock Domain**
- Controls FIFO write operations.
- Maintains the binary and Gray-code write pointers.
- Synchronizes the read Gray-code pointer.

**Read Clock Domain**
- Controls FIFO read operations.
- Maintains the binary and Gray-code read pointers.
- Synchronizes the write Gray-code pointer.

## 4. Repository Structure

```text
asynchronous-fifo/
│
├── README.md
├── .gitignore
│
├── rtl/
│   ├── synchronizer.sv
│   ├── binary_to_gray.sv
│   ├── gray_to_binary.sv
│   ├── fifo_memory.sv
│   └── async_fifo.sv
│
├── tb/
│   ├── tb_synchronizer.sv
│   ├── tb_async_fifo.sv
│   └── fifo_tasks.sv
│
├── sim/
│   ├── scripts/
│   ├── logs/
│   └── waveforms/
│
├── docs/
│   ├── architecture/
│   ├── design_notes/
│   ├── timing_diagrams/
│   └── verification/
│
├── synthesis/
│   ├── scripts/
│   └── reports/
│
└── results/
    ├── simulation/
    └── synthesis/
```

## 5. Design Specifications

The FIFO will be parameterized to support configurable data width and FIFO depth.

| Parameter | Description |
|---|---|
| DATA_WIDTH | Number of bits per FIFO entry |
| FIFO_DEPTH | Total number of FIFO entries |
| ADDR_WIDTH | Address width required to access FIFO memory |
| PTR_WIDTH | Pointer width, including the additional wraparound bit |

The pointer width will be calculated as:

`PTR_WIDTH = ADDR_WIDTH + 1`

For a power-of-two FIFO depth:

`ADDR_WIDTH = log2(FIFO_DEPTH)`

## 6. CDC Implementation

Clock Domain Crossing is one of the most important aspects of an asynchronous FIFO.

The design will use:

- Gray-code pointers to reduce multi-bit transition incoherency during CDC.
- Two-flop synchronizers to reduce the probability of metastability propagating into destination logic.
- Independent synchronization paths for read and write pointers.
- Appropriate pointer comparison logic for full and empty detection.

## 7. Verification Plan

The FIFO will be verified using SystemVerilog testbenches.

The verification plan includes:

- Reset behaviour
- Basic write and read operations
- Empty FIFO condition
- Full FIFO condition
- Overflow protection
- Underflow protection
- Independent read and write clock frequencies
- Simultaneous read and write operations
- Pointer wraparound
- Data ordering and integrity
- Randomized read and write operations
- Boundary and corner-case scenarios

## 8. Development Methodology

Each functional block will be developed and verified independently before integration.

The project will follow this development flow:

1. Understand the functional requirement.
2. Study the underlying hardware concepts.
3. Develop the block architecture.
4. Implement the RTL using SystemVerilog.
5. Create a dedicated testbench.
6. Simulate and analyze waveforms.
7. Debug and verify functionality.
8. Integrate the block into the complete FIFO.
9. Perform synthesis and analyze hardware implications.
10. Document the results.

## 9. Tools and Technologies

| Category | Technology |
|---|---|
| RTL Language | SystemVerilog |
| Design Approach | Modular RTL Design |
| Verification | SystemVerilog Testbenches |
| Simulation | To be finalized |
| Waveform Analysis | To be finalized |
| Synthesis | To be finalized |
| Version Control | Git and GitHub |

## 10. Project Development Status

| Component | Status |
|---|---|
| Architecture and Fundamentals | Completed |
| Repository Setup | In Progress |
| Two-Flop Synchronizer | Pending |
| Binary-to-Gray Conversion | Pending |
| Gray-to-Binary Conversion | Pending |
| FIFO Memory | Pending |
| Read and Write Pointer Logic | Pending |
| Full and Empty Detection | Pending |
| Top-Level FIFO Integration | Pending |
| Functional Verification | Pending |
| Synthesis and Analysis | Pending |
| Final Documentation | Pending |

## 11. Expected Outcome

The final outcome will be a parameterized asynchronous FIFO RTL design with a structured verification environment.

The project will demonstrate practical understanding of:

- RTL design using SystemVerilog
- Sequential and combinational logic
- FIFO architecture
- Clock Domain Crossing
- Gray-code pointer implementation
- Metastability mitigation
- Functional verification
- Simulation and waveform debugging
- Synthesis and hardware analysis

---

**Project:** Parameterized Asynchronous FIFO  
**Language:** SystemVerilog  
**Focus:** RTL Design, CDC, Verification and Synthesis
