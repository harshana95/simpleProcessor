module regfile8x8a(clk, INaddr, IN, OUT1addr, OUT1, OUT2addr, OUT2);

	input clk;
	input [2:0] INaddr,OUT1addr,OUT2addr;
	input [7:0] IN;
	output [7:0] OUT1, OUT2;
	
	reg [7:0] reg0, reg1, reg2, reg3,reg4,reg5,reg6,reg7;

	assign OUT1 = OUT1addr==0?reg0:OUT1addr==1?reg1:OUT1addr==2?reg2:OUT1addr==3?reg3:OUT1addr==4?reg4:OUT1addr==5?reg5:OUT1addr==6?reg6:OUT1addr==7?reg7:0;
	assign OUT2 = OUT2addr==0?reg0:OUT2addr==1?reg1:OUT2addr==2?reg2:OUT2addr==3?reg3:OUT2addr==4?reg4:OUT2addr==5?reg5:OUT2addr==6?reg6:OUT2addr==7?reg7:0;

	always @(negedge clk) 
	begin
	$display("ADDR\nOUT1addr - %d\nOUT2addr - %d\nINaddr - %d\n", OUT1addr, OUT2addr,INaddr);
	$display("Outputs from Register\nOUT1-%d\tOUT2-%d",OUT1,OUT2);
	#10
	if (INaddr == 0) begin
		reg0 = IN;
	end
	if (INaddr == 1) begin
		reg1 = IN;
	end
	if (INaddr == 2) begin
		reg2 = IN;
	end
	if (INaddr == 3) begin
		reg3 = IN;
	end
	if (INaddr == 4) begin
		reg4 = IN;
	end
	if (INaddr == 5) begin
		reg5 = IN;
	end
	if (INaddr == 6) begin
		reg6 = IN;
	end
	if (INaddr == 7) begin
		reg7 = IN;
	end
	/*case(INaddr)
		 0:
			assign reg0 = IN;
		 1:
			assign reg1 = IN;
		 2:
			assign reg2 = IN;
		 3:
			assign reg3 = IN;
		 4:
			assign reg4 = IN;
		 5:
			assign reg5 = IN;
		 6:
			assign reg6 = IN;
		 7:
			assign reg7 = IN;
	endcase
	*/
	$display("Input to the Register\ntoWrite-%d\n",IN);
	$display("regs %d %d %d %d %d %d %d %d", reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7);
	end 
endmodule
/*
module test;
	reg [7:0] in;
	reg [2:0] inaddr, out1addr, out2addr;
	wire [7:0] out1, out2;
	reg clk;

	regfile8x8a myReg(clk,inaddr,in, out1addr, out1, out2addr,out2);

	initial
	begin
		in = 8'd2;
		inaddr = 3'd1;
		out1addr = 3'd1;
		out2addr = 3'd2;
		#5 $display("before clk %d %d", out1, out2);
		#5 clk = 1;
		#5 $display("after posedge %d %d", out1, out2);
		#5 clk = 0;
		#5 $display("after negedge %d %d", out1, out2);
		inaddr = 3'd2;
		#5 clk = 1;
		#5 $display("after posedge %d %d", out1, out2);
		#5 clk = 0;
		#5 $display("after negedge %d %d", out1, out2);
		
		$finish;
	end
endmodule
*/