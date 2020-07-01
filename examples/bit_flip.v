module bit_flip(
	input start,
	input index,
	input[31:0] in,
	output [31:0] out
);

reg [31:0] cout;
reg i;

assign out = cout;

always @(posedge start) begin
	cout <= out;
  	for (i = 0; i < 32; i++) begin
		if (i == index) cout[i] = (cout[i] == 1'b1) ? 1'b0 : 1'b1; 
	end
end

endmodule


module bit_flip_tb();

reg start;
reg index;
wire [31:0] in;
wire [31:0] out;

bit_flip UUT(.start(start, .index(index), .in(in), .out(out));

initital
begin
	$dumpfile("sim.vcd");
	$dumpvars;
	index <= 16;
	in <= 32'b0;
	start <= 1;
	#20;




