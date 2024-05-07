`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SHOBHIT SHARMA
// 
// Create Date:    14:45:26 04/10/2024 
// Design Name: 
// Module Name:    memory 
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
module memory(clk, state, address, operation, load_value
    );

   input clk;
    // This basically is wired to the result which in case of lw is address of DATA MEMORY
   input[31:0] address;
	input[2:0] state;
    input[1:0] operation;
	
	reg[7:0] data_mem [0:2];
	output reg[7:0] load_value;
	



	
	always @ (posedge clk) begin
	   	if (state == `STATE_MEM) begin
		   	if (operation == `MEM_READ) begin
			   	load_value <= data_mem[address];
			end
		end
	end

	initial begin
	   	data_mem[0] = 8'b11111101; // a
		data_mem[1] = 8'b00000101; // b
		data_mem[2] = 8'b00000011; // c
	end

endmodule