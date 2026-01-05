
# 🛠️ Learning Log & Engineering Notes

## Week 2: Arithmetic Logic Unit (ALU) Design
**Date:** 2024-01-xx

### 🎯 Objectives
Design a 32-bit ALU supporting basic RISC-V arithmetic and logical operations.

### 💡 Implementation Details
- Used `typedef enum` to define operation codes for better readability.
- Implemented `ALU_SLT` (Set Less Than) using signed comparison `$signed()`.
- **Challenge**: Initially, the subtraction logic had a bug where the `zero` flag wasn't updating correctly.
- **Solution**: Fixed the combinational logic path and verified with `tb_alu.sv`.

### 📸 Waveform Verification
*(在这里插入你刚才 ALU 仿真成功的波形截图，图片放在 docs/images 目录下)*
![ALU Waveform](images/alu_waveform_20240105.png)

### 📚 Key Takeaways
- SystemVerilog's `always_comb` prevents latch inference effectively.
- Separation of Data Path and Control logic makes debugging easier.