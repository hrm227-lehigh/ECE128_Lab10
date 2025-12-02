module lab10_top_tb;
reg clk, rst;
reg [2:0] addr1, addr2;
wire [7:0] result;

lab10_top uut(.clk(clk), .rst(rst), .addr1(addr1), .addr2(addr2), .result(result));

initial begin
	clk = 0;
	rst = 1;
end

always #5 clk = ~clk;

initial begin
    addr1 = 3'd0; addr2 = 3'd0;
	#10 rst = 0;
	
	#40 addr1 = 3'd1; addr2 = 3'd2;
	#40 addr1 = 3'd2; addr2 = 3'd3;
	#40 addr1 = 3'd4; addr2 = 3'd5;
	#40 addr1 = 3'd2; addr2 = 3'd4;
	#40 addr1 = 3'd6; addr2 = 3'd5;
	#40 addr1 = 3'd3; addr2 = 3'd7;
	#80 $finish;
end

endmodule