# 8-bit Arithmetic Logic Unit (ALU)

## Overview

An 8-bit Arithmetic Logic Unit designed using Verilog HDL.

The ALU performs eight arithmetic and logical operations and generates four status flags.

## Features

- 8-bit input and output
- 8 different operations
- Arithmetic and logical operations
- Left and right shift operations
- Equality comparison
- Four status flags

## Operations

| Opcode | Operation | Description |
|---|---|---|
| 000 | ADD | A + B |
| 001 | SUB | A - B |
| 010 | AND | A & B |
| 011 | OR | A \| B |
| 100 | XOR | A ^ B |
| 101 | Left Shift | A << B[2:0] |
| 110 | Right Shift | A >> B[2:0] |
| 111 | Compare | A == B |

## Status Flags

| Flag | Description |
|---|---|
| Zero | Set when result is zero |
| Carry | Ninth bit of the intermediate result |
| Overflow | Indicates signed arithmetic overflow |
| Negative | MSB of the result |

**Note:** During subtraction, the carry output indicates borrow (1 when A < B).

## Design Details

- 9-bit temporary register to capture carry.
- Combinational logic using `always @(*)`.
- Default assignments prevent inferred latches.
- Shift amount uses `b[2:0]`.
- Comparison returns 1 when both inputs are equal.

## Project Structure

```text
01-alu/
├── README.md
├── rtl/
│   └── alu.v
├── tb/
│   └── alu_tb.v
└── docs/
    ├── waveform_overview.pdf
    └── waveform_flags.pdf
```

## Simulation

Tools:
- Icarus Verilog
- GTKWave
- Verilog HDL

Compile:

```bash
iverilog -o alu.vvp rtl/alu.v tb/alu_tb.v
```

Run:

```bash
vvp alu.vvp
```

View waveform:

```bash
gtkwave alu.vcd
```

## Waveform Results

### ALU Operation Overview

[View Overview Waveform (PDF)](docs/waveform_alu.pdf)

### Carry and Overflow Verification

[View Flag Verification (PDF)](docs/waveform_alu_flag.pdf)

## Verification

The testbench contains 34 directed test cases covering all eight operations, including arithmetic edge cases.

**Simulation Results: 34 passed, 0 failed.**

All eight ALU operations were verified using directed test cases.

## Future Improvements

- Randomized testing
- Reference model
- Signed arithmetic and arithmetic shifts
- SystemVerilog implementation
- Advanced verification using UVM

## Author

Sriram N

Electronics and Communication Engineering