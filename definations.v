`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:25 04/10/2024 
// Design Name: 
// Module Name:    definations 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// // We first define the states as done in Slide 3
`define STATE_IF 0
`define STATE_ID 1
`define STATE_RF 2
`define STATE_EX 3
`define STATE_MEM 4
`define STATE_WB 5
`define STATE_OUTPUT 6

// // We also define operations on memory
`define MEM_READ  2'h0
`define MEM_WRITE 2'h1
// // We then define opcodes of various instructions 
// I FORMAT instructions
`define OP_ADDIU 6'h9 
`define OP_LW    6'h23
`define OP_BEQ   6'h4
`define OP_BNE   6'h5
// R FORMAT instructions have opcode 0 and we also define their Function fields
`define OP_RFORM    6'h0
`define OP_ADDU     6'h0
`define OP_SLT      6'h0
`define FUNC_ADDU   6'h21
`define FUNC_SLT    6'h2a