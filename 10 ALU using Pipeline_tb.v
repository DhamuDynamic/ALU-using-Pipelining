module ALU_tb();
	reg clk1,clk2;
	reg [3:0] rs1,rs2,rd,func;
	reg [7:0] addr;
	wire [15:0] y;
	integer k;
	ALU dut (clk1,clk2,rs1,rs2,rd,addr,func,y);
	initial
		begin
			clk1 = 1'b0;
			clk2 = 1'b0;
			repeat(30)
				begin
					#5 clk1 = 1;
					#5 clk1 = 0;
					#5 clk2 = 1;
					#5 clk2 = 0;
				end
		end
	initial
		begin
			for(k=0;k<16;k=k+1)
				begin
					dut.RegBank[k] = k;
				end
		end
	initial
		begin
			#5;
			rs1 = 7;
			rs2 = 3;
			rd = 10;
			func = 0;
			addr = 100;
			#20;
			rs1 = 7;
			rs2 = 3;
			rd = 11;
			func = 1;
			addr = 101;
			#20;
			rs1 = 7;
			rs2 = 3;
			rd = 12;
			func = 2;
			addr = 102;
			#20;
			rs1 = 7;
			rs2 = 3;
			rd = 13;
			func = 3;
			addr = 103;
			#20;
			rs1 = 7;
			rs2 = 3;
			rd = 14;
			func = 4;
			addr = 104;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 15;
			func = 5;
			addr = 105;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 9;
			func = 6;
			addr = 106;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 8;
			func = 7;
			addr = 107;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 7;
			func = 8;
			addr = 108;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 6;
			func = 9;
			addr = 109;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 5;
			func = 10;
			addr = 110;
			#20
			rs1 = 7;
			rs2 = 3;
			rd = 4;
			func = 11;
			addr = 111;
			#60;
			for(k=0;k<106;k=k+1)
				begin
					$display("Mem[%3d] = %3d",k,dut.Mem[k]);
				end
		end
	initial
		begin
			$dumpfile("ALU.vcd");
			$dumpvars(0,ALU_tb);
			$monitor ("Time = %d, Y = %3d",$time,y);
			#300 $finish;
		end
endmodule
