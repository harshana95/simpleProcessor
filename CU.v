module CU(instruction,OUT1addr,OUT2addr,INaddr);
	input [31:0] instruction;
	output [2:0] OUT1addr;
	output [2:0] OUT2addr;
	output [2:0] INaddr;
	reg OUT2addr,OUT1addr,INaddr;

	always @(instruction) begin
	        OUT1addr = instruction[2:0];
			OUT2addr = instruction[10:8];
			INaddr = instruction[18:16];
	end
endmodule
