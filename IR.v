module Instruction_reg (clk, Read_Addr, instruction);
	input clk;
	input [31:0] Read_Addr;
	output [31:0] instruction;

	reg [31:0] instruction;
	reg [7:0]  in;

	always @(posedge clk) begin
			$display("-------------posedge clk--------------------\n");
		    #10 instruction = 	Read_Addr==0?32'b00100000000001000000000011111111:
								Read_Addr==1?32'b00100000000001100000000010101010:
								Read_Addr==2?32'b00100000000000110000000010111011:
								Read_Addr==3?32'b00000001000001010000011000000011:
								Read_Addr==4?32'b00000010000000010000010000000101:
								Read_Addr==5?32'b00000011000000100000000100000110:
								Read_Addr==6?32'b00000000000001110000000000000010:
								Read_Addr==7?32'b01000001000001000000011100000011:
						32'b00000000000000000000000000000000;
	end
	
endmodule
