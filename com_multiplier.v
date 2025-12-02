module com_mult(a, b, p);
input [3:0] a, b;
wire [3:0] m0;
wire [4:0] m1;
wire [5:0] m2;
wire [6:0] m3;

wire [7:0] s1, s2, s3;
output [7:0] p;

assign m0 = {4{b[0]}} & a;
assign m1 = {5{b[1]}} & {a, 1'b0};
assign m2 = {6{b[2]}} & {a, 2'b0};
assign m3 = {7{b[3]}} & {a, 3'b0};

assign s1 = {4'b0, m0};
assign s2 = s1 + {3'b0, m1};
assign s3 = s2 + {2'b0, m2};
assign p = s3 +{1'b0, m3};


endmodule