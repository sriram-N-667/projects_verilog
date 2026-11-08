# Sriram N | Verilog & VLSI Journey

Hi, I'm Sriram N, a 2nd-year ECE student at Rajalakshmi engineering college chennai, India.
I'm learning digital design and verification with the goal of working in
**RTL design / design verification (DV)**, and later **SoC and NoC** design.

This repo tracks my projects, notes, and progress, so every project here is
something I built, simulated, and can explain.

## Roadmap

| # |               Project                         |     Status     |            Key concepts             |
|---|-----------------------------------------------|----------------|-------------------------------------|
| 1 | [8-bit ALU with flags](./01-alu)              | ✅ DONE        | Combinational design, testbenches   |
| 2 | [Synchronous FIFO](./02-sync-fifo)            | 🟡 In progress |Pointers, full/empty logic           |
| 3 | [UART TX/RX](./03-uart)                       | ⚪ Planned     | FSMs, baud generator                |
| 4 | [SPI master/slave](./04-spi)                  | ⚪ Planned     | Protocol design                     |
| 5 | [Asynchronous FIFO](./05-async-fifo)          | ⚪ Planned     | CDC, Gray code                      |
| 6 | [APB/AXI-Lite slave](./06-apb-axi-lite-slave) | ⚪ Planned     | Bus protocols, registers            |
| 7 | [RISC-V (RV32I) core](./07-riscv-core)        | ⚪ Planned     | Datapath, control, pipelining       |

**Status key:** ✅ Done | 🟡 In progress | ⚪ Planned

## Learning path

1. **Verilog:** combinational, sequential, FSMs, testbenches
2. **RTL design:** CDC, FIFOs, synthesis
3. **SystemVerilog and UVM:** verification of my own designs
4. **SoC:** AMBA buses, mini SoC with RISC-V
5. **NoC:** router and mesh network

## Tools

- Simulation: Icarus Verilog,  EDA Playground
- Waveforms: GTKWave
- Synthesis: Yosys 
- Version control: Git, GitHub
- OS: Ubuntu
- 
## Repo structure

```
.
├── 01-alu/
├── 02-sync-fifo/
├── ...
└── resources/    # notes, cheat sheets, useful links
```

Every project folder contains `rtl/`, `tb/`, `sim/`, `docs/`, and its own README
with a block diagram, instructions to run, and waveform screenshots.

## How to run a project

```bash
cd 02-sync-fifo
make          # compile and run the testbench
make wave     # open the waveform in GTKWave
```

## Resources I'm using

- *Verilog HDL* by Samir Palnitkar
- HDLBits, ChipVerify, Verification Academy
- Cliff Cummings' papers (sunburst-design.com)


## Contact

- LinkedIn: www.linkedin.com/in/sriram-n-819298383
- Email: sriramnaren96@gmail.com

*Last updated: 7 november 2026
