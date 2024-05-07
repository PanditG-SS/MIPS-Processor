`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:52 04/10/2024 
// Design Name: 
// Module Name:    MIPS 
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
 module MIPS(clk,led_output);
   	input clk;
	output reg[7:0] led_output;
    // Create wires for state and fields in Format of instructions
	wire[2:0]  state;
	wire[4:0]  rs;
	wire[4:0]  rtemp;
	wire[4:0] rd;
	wire[5:0] func;
	wire[5:0] opcode;
    // For I format instruction, we need to store the immediate value
   		wire[15:0] immediate_value;
	// Create a Integer Program Counter
	wire[31:0] PC;
	
	// For stroing the results
	wire[7:0] result;
	wire is_valid;
	wire[7:0] rsourcev;
	wire[7:0] rtempv;
    // For loading the 8 bit value
	wire[7:0] value_to_load;
	
   always @ (posedge clk) begin
	   	if (state == `STATE_OUTPUT) begin
		   	led_output <= rsourcev; // Then we print the state finally.
		end
	end

	Control_state uut1(clk, PC, state);
	memory uut2(clk, state, result,(opcode != `OP_LW) ? 2'h2:`MEM_READ, value_to_load);
	fetch_instructionIFID uut3(clk, state, PC, opcode, rsource, rtemp, rd, immediate_value, func);
   	Regfile uut4(clk, state, rsource, rtemp, (opcode == `OP_RFORM) ? rd : rtemp, (opcode != `OP_LW) ?  result: value_to_load, is_valid, rsourcev, rtempv);
	Executer uut5(clk, state,rsourcev, rtempv, opcode, immediate_value, func, PC, result, is_valid);
	
	

endmodule