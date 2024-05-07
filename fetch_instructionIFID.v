`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:37 04/10/2024 
// Design Name: 
// Module Name:    fetch_instructionIFID 
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
`include "definations.v"

module fetch_instructionIFID(clk, state, PC, opcode, rsource, rtemp, rdestination, immediate_value, value_func
    );
    

   	input clk;
	input[2:0] state;
	input[31:0] PC;
	output reg [5:0] opcode;
	output reg [4:0] rsource;
	output reg [4:0] rtemp;
	output reg [4:0] rdestination;
	output reg [15:0] immediate_value;
	output reg [5:0] value_func;

    reg [31:0] instruction;
	reg [31:0] i_memory [0:10];
	
	always @ (posedge clk) begin
        // Whenver the state is 0 or instruction fetch , then put the instruction at PC into INSTRUCTION
	   	if (state == `STATE_IF) begin
		   	instruction <= i_memory[PC];
		end 
        else if (state == `STATE_ID) begin
		   	opcode <= instruction[31:26];
			rsource <= instruction[25:21];
			rtemp <= instruction[20:16];
			rdestination <= instruction[15:11];
			immediate_value <= instruction[15:0];
			value_func <= instruction[5:0];
		end
	end

    initial begin
		instruction = 0;
        // opcode (6) rsource (5) rtemp (5) rdestination(5) sh amt(5) function(6)
        // We write the 11 instructions the in the order given in program.
		i_memory[0] =32'b10001100000000010000000000000000;
		i_memory[1] =32'b10001100000000100000000000000001;
		i_memory[2] =32'b10001100000000110000000000000010;
		i_memory[3] =32'b00100100000001000000000000000000;
		i_memory[4] =32'b00100100001001010000000000000000;
		i_memory[5] =32'b00000000101000100011000000101010;
		i_memory[6] =32'b00010000110000000000000000000101;
		i_memory[7] =32'b00000000100001010010000000100001;
		i_memory[8] =32'b00000000101000110010100000100001;
		i_memory[9] =32'b00000000101000100011000000101010;
		i_memory[10] =32'b00010100110000001111111111111101;
	end

endmodule