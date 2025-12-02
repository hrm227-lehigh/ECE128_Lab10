module lab10_top(
	input clk, rst,
	input [2:0] addr1, addr2, //we are providing the ROM addresses to be read from ROM and given to the register files
	output [7:0] result
);
wire [3:0] rom_data;
wire [3:0] a, b;
wire [7:0] product;
wire [2:0] rom_addr, ram_addr;

wire rf_w, ram_w;
wire [1:0] rf_w_addr;

ROM rom_1(.ROM_data(rom_data), .ROM_addr(rom_addr));

reg_file reg_file1(.clk(clk), .rst(rst), .w(rf_w), .w_addr(rf_w_addr), .w_data(rom_data), .a(a), .b(b));

com_mult mult_1(.a(a), .b(b), .p(product));

RAM ram_1(.clk(clk), .rst(rst), .w(ram_w), .data_in(product), .data_adr(ram_addr), .data_out(result));

control_unit CU1(.clk(clk), .rst(rst), .addr1(addr1), .addr2(addr2), .rom_addr(rom_addr), .rf_w(rf_w), .rf_w_addr(rf_w_addr), .ram_addr(ram_addr), .ram_w(ram_w));

endmodule