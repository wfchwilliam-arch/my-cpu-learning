# My RISC-V Core Learning Journey
# My CPU Learning Journey: From Logic Gates to RISC-V Core

![Status](https://img.shields.io/badge/Status-Active_Learning-green)
![Language](https://img.shields.io/badge/Language-SystemVerilog-blue)
![Tools](https://img.shields.io/badge/Tools-Verilator_%7C_GTKWave_%7C_Logisim-orange)

## 📖 Introduction
This repository documents my journey of building a RISC-V processor from scratch. 
As a hardware engineer with 10+ years of experience, I am transitioning into Digital IC Design. My goal is to bridge the gap between physical hardware intuition and digital architecture.

The project follows the curriculum of **"Digital Design and Computer Architecture (RISC-V Edition)"** by Harris & Harris, moving from basic logic gates to a fully functional pipelined processor.

## 🛠️ Tech Stack & Tools
* **Language**: SystemVerilog (IEEE 1800-2017)
* **Simulation**: Verilator (Fast C++ based simulation)
* **Waveform Viewer**: GTKWave
* **Schematic Entry**: Logisim-Evolution
* **Environment**: macOS (Apple Silicon)

## 📂 Project Structure
```text
.
├── rtl/            # RTL Source Code (SystemVerilog)
│   ├── common/     # Basic blocks (Mux, Adder, ALU)
│   └── core/       # CPU Core components (Datapath, Control Unit)
├── tb/             # Testbenches
├── sim/            # Simulation scripts & Waveforms (.vcd files ignored)
├── docs/           # Learning Journal & Diagrams
│   └── journal.md  # Daily "Morning Hour" progress log
└── README.md
