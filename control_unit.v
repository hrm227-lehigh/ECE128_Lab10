module control_unit(
	input clk, rst,
	input [2:0] addr1, addr2,
	output reg [2:0] rom_addr,
	output reg rf_w,
	output reg[1:0] rf_w_addr,
	output reg ram_w,
	output reg[2:0] ram_addr
);
reg [2:0] state;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;

always @(posedge clk) begin
	if (rst) begin
		state <= s0;
		rom_addr <= 0;
		ram_addr <= 0;
		rf_w <= 0;
		ram_w <= 0;
		rf_w_addr <= 0;
	end
	else begin
	case(state)
		s0: begin
		rom_addr <= addr1;
			rf_w <= 1;
			rf_w_addr <= 0;
			ram_w <= 0;
			state <= s1;
		end
		
		s1: begin
			rom_addr <= addr2;
			rf_w <= 1;
			rf_w_addr <= 1;
			ram_w <= 0;
			state <= s2;
		end
		
		s2: begin
			rf_w <= 0;
			ram_w <= 0;
			state <= s3;
		end
		
		s3: begin
			ram_w <= 1;
			state <= s0;
		end
		
	endcase
	end
end
endmodule