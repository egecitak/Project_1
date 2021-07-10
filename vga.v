

module Project_1(clk, vga_hsy, vga_vsy, vga_red, vga_blue, vga_green);

input clk;
output vga_hsy, vga_vsy, vga_red, vga_blue, vga_green;

reg clk_25, vga_red, vga_blue, vga_green, vgah, vgav;
reg [1:0] counter;
reg [9:0] x_counter;
reg [8:0] y_counter;

initial
begin
	counter=0;
	clk_25 = 0;
	x_counter = 0;
	y_counter = 0;
end

//25 MHz
always@ (posedge clk)
	
	begin
		counter = counter+1;
		if (counter ==2)
			begin
				clk_25 = ~clk_25;
				counter = 0;
			end
	end

//VGA
always@ (posedge clk_25)
	
	begin
		if (x_counter<799)
			x_counter=x_counter+1;
	else
		begin
			x_counter=0;
		if (y_counter< 524)
			y_counter=y_counter+1;
		else
			y_counter=0;
		end
		if (x_counter>655 & x_counter<751)
			vgah = 0;
		else
			vgah = 1;
		if (y_counter>489 & y_counter<491)
			vgav = 0;
		else
			vgav = 1;
end

assign vga_hsy=vgah;
assign vga_vsy=vgav;

always@ (posedge clk_25)
	begin
		if (x_counter > 0 && x_counter < 100 && y_counter > 0 && y_counter < 100)
		begin
			vga_red = 1;
		end
	end

endmodule
