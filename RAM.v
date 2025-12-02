module RAM(clk, rst, w, data_in, data_adr, data_out);
input clk, rst, w;
parameter data_w = 8;
parameter adr_w = 3;
parameter size = 8;

input [data_w - 1:0] data_in;
input [adr_w - 1:0] data_adr; //8 locations
output reg [data_w - 1:0] data_out;

reg [data_w - 1:0] mem [size-1:0]; //data width = 8 bits, 8 locations

integer i;
always @(posedge clk)
begin
	if (rst)begin //mem == 0
	   for(i = 0; i <size ; i = i+1)begin
	       mem[i] = 8'd0;
	   end
	end
	
	else begin
		//mem read or write
		if(w) begin //write
			mem[data_adr] <= data_in;
		end	
		
		else begin //read
			data_out <= mem[data_adr];
		end
	end
end

endmodule