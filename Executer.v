`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:50 04/10/2024 
// Design Name: 
// Module Name:    Executer 
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

module Executer(clk, state, rsourcev, rtempv,opcode, immediate_value, value_function, PC, result, is_valid
    );

// Basic declarations of inputs and outputs
   	input clk;
	input[2:0] state;
	input[5:0] opcode;	
	input[15:0] immediate_value;
	input[5:0] value_function;
	input[7:0] rsourcev;
	input[7:0] rtempv;
	
	output reg [7:0] PC;
	output reg [7:0] result;
	output reg is_valid;
	
	
	
	always @ (posedge clk) begin
        // As soon as the execute instruction starts, we need to store the result & its validity
	   	if (state == `STATE_EX) begin
		   	if ((opcode ==`OP_ADDU)&&(value_function== `FUNC_ADDU)) begin
			   	result <= rsourcev + rtempv;
				is_valid <= 1;
				PC <= PC+1;
			end
			else if ((opcode ==`OP_SLT)&&(value_function== `FUNC_SLT)) begin
			   	result <=($signed(rsourcev)<$signed(rtempv)) ? 8'd1 : 8'd0;
				is_valid <= 1;
				PC <= PC+1;
			end
            else if (opcode ==`OP_BEQ) begin
			   	PC <= ((rsourcev == rtempv) ? (PC+immediate_value[7:0]) :(PC+1));
				is_valid <= 0;
			end
			else if (opcode== `OP_BNE) begin
			   	PC <= ((rsourcev != rtempv) ? (PC+immediate_value[7:0]) :(PC+1));
				is_valid <= 0;
			end
			else if (opcode ==`OP_ADDIU) begin
			   	result <= rsourcev +immediate_value[7:0];
				PC <= PC+1;
				is_valid <= 1;
				
			end
            else if (opcode ==`OP_LW) begin
			   	result <= rsourcev +immediate_value[7:0];
				PC <= PC+1;
				is_valid <= 1;
				
			end
			else begin // Do nothing code, sit idle
				PC <= PC+1;
			   	is_valid <= 0;
				
			end
		end
	end

    initial begin
	   	is_valid = 0;
		PC = 0;
	end

endmodule
