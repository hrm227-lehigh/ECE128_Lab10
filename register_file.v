module reg_file(
	input clk, rst,
    input w,
    input [1:0] w_addr,
    input [3:0] w_data,
    output [3:0] a,
    output [3:0] b
);
reg [3:0] registers [1:0];

assign a = registers [0];
assign b = registers [1];

always@(posedge clk) begin
	if(rst) begin
		registers[0] <= 0;
		registers[1] <= 0;
	end
	else if (w) begin
		registers[w_addr] <= w_data;
	end
end

endmodule