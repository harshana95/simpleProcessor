module twoscompl(in,out);
	input [7:0] in;
	output [7:0] out;
	reg out;
	always begin
		#5 out = -in;	
	end
endmodule