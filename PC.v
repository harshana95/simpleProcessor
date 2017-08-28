
module PC (clk, reset,Read_addr);
	//points to the next instruction
	input clk;
	input reset;
	output [31:0] Read_addr;
	//The outputs are defined as registers too
	reg [31:0] Read_addr;
	//The counter doesn't have any delay since the
	//output is latched when the negedgeof the clock happens.

	always @(negedge clk) begin
		$display("-------------negedge clk--------------------\n");
		Read_addr = reset == 1? 0:Read_addr + 1;
	end
endmodule