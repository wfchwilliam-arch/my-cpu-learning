# My RISC-V Core Learning Journey
<div align="center">

# 🚀 OpenRISC-V Core
### A SystemVerilog-based, 5-stage Pipelined RISC-V Processor

![Language](https://img.shields.io/badge/Language-SystemVerilog-007ACC?style=for-the-badge&logo=verilog)
![ISA](https://img.shields.io/badge/ISA-RISC--V_RV32I-EA5455?style=for-the-badge&logo=riscv)
![Status](https://img.shields.io/badge/Status-Active_Development-4CAF50?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

[Documentation](./docs/learning_log.md) | [Architecture](./docs/arch.md) | [Testbench](./sim)

</div>

---

## 📖 Overview

**OpenRISC-V Core** is an educational yet functional 32-bit RISC-V processor core designed from scratch. The goal is to build a synthesizable processor that follows the "First Principles" of digital design, inspired by the book *Digital Design and Computer Architecture*.

This project documents the journey from basic logic gates to a fully functional SoC running on FPGA.

## 📅 Roadmap & Progress (6-Month Plan)

> **Current Phase: Phase 1 - Digital Logic Foundation** 🚧

| Phase | Timeline | Focus Area | Status |
| :--- | :--- | :--- | :--- |
| **Phase 1** | Month 1 | **Logic Foundation & Tools** | 🟢 In Progress |
| **Phase 2** | Month 2 | **Single-Cycle Processor** | ⚪️ Planned |
| **Phase 3** | Month 3 | **Pipelining & Hazards** | ⚪️ Planned |
| **Phase 4** | Month 4 | **Memory Hierarchy (Cache)** | ⚪️ Planned |
| **Phase 5** | Month 5 | **Bus & Peripherals** | ⚪️ Planned |
| **Phase 6** | Month 6 | **FPGA & C Runtime** | ⚪️ Planned |

<details>
<summary>🔻 <b>Click to expand detailed checklist (详细进度表)</b></summary>

### Phase 1: Digital Logic Foundation & Tools
- [x] Environment Setup (VS Code, Icarus Verilog, GTKWave)
- [x] Basic Logic Design (Mux, DFF, FSM)
- [x] **ALU Design**: Support ADD, SUB, AND, OR, SLT, etc.
- [ ] Register File (32x32) Design

### Phase 2: Single-Cycle Processor
- [ ] Datapath Integration (PC + IMEM + RegFile + ALU)
- [ ] Control Unit Implementation (Decoder)
- [ ] Instruction Support: `lw`, `sw`, `add`, `addi`, `beq`

### Phase 3: Pipelined Processor
- [ ] 5-Stage Pipeline Split (IF, ID, EX, MEM, WB)
- [ ] Hazard Unit (Data Hazard detection)
- [ ] Forwarding Unit (Resolve Data Hazards)
- [ ] Branch Prediction (Static -> 2-bit Dynamic)

### Phase 4: Memory System & Bus
- [ ] Instruction/Data Cache (Direct Mapped)
- [ ] Bus Interface (AXI-Lite or Simple-Bus)

### Phase 5 & 6: System Integration
- [ ] UART Peripheral Integration
- [ ] Synthesis on FPGA
- [ ] Run C Programs via GCC
</details>

<br>

## 🗂️ Project Structure

The project follows a standard industrial ASIC/FPGA directory structure:

```text
.
├── rtl/                # RTL Design Source (SystemVerilog)
│   ├── core/           # CPU Core logic (ALU, Datapath...)
│   ├── perips/         # Peripherals (GPIO, UART...)
│   └── includes/       # Global definitions and parameters
├── sim/                # Simulation Environment
│   ├── basic_logic/    # Tests for basic components
│   └── alu/            # Tests for ALU
├── docs/               # Documentation & Diagrams
│   ├── images/         # Waveforms and Arch diagrams
│   └── learning_log.md # Weekly technical notes
└── tools/              # Helper scripts