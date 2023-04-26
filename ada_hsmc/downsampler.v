module DOWNSAMPLER #(
  parameter WINDOW = 325 // 65MHz/200kHz
)(
	CLOCK_IN,
	DATA_IN,
	DATA_OUT,
	ENABLE,
	TRIGGER

);

/*
INPUT FREQ - 65MHz
OUTPUT FREQ - 200kHz

*/

input CLOCK_IN;
input DATA_IN;
output [13:0] DATA_OUT;
input ENABLE;
output TRIGGER;

reg 	[25:0]	cCLOCK;	

	
reg	[WINDOW:0]	mem;
reg	[13:0]	average;

assign DATA_OUT = average;


initial begin
	cCLOCK <= 0;
	average <= 0;
end


always @ (posedge CLOCK_IN)
begin

// Write the incoming sample to memory
	mem[wraddr] <= i_sample;
	wraddr <= wraddr + 1'b1;

	// Read the x[n-N] value from memory
	memval <= mem[rdaddr];
	rdaddr <= rdaddr + 1'b1;

	// Subtract x[n-N] from the incoming sample, x[n]
	// sub = x[n] - x[n-N]
	sub <= (i_sample - memval);

	// Add the result to the last output
	// y[n] = y[n-1] + sub = y[n-1]+x[n]-x[n-N]
	acc <= acc + sub;

	// rounded() is shorthand for what we wish to do
	// but not really valid Verilog
	average <= rounded(acc);

	if(wraddr == 324)
	begin
		wraddr <= 0;
	end
	
end
