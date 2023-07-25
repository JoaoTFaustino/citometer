module RANDOM_GENERATOR(
	CLOCK_IN,
	RESET,
	DATA,
	ENABLE
);

			
input 					CLOCK_IN;
input 					RESET;
input						ENABLE;
output	reg [13:0]	DATA;
/*

// Random Generator

reg [8:0] shift_register = 9'h1FF; // Valor inicial do registrador de deslocamento

always @ (posedge CLOCK_IN)
begin	
	if (RESET)
	begin
		shift_register <= 9'h1FF;
	end
	
	else if (ENABLE)
	begin
		shift_register <= {shift_register[7:0], shift_register[8] ^ shift_register[5]};	
		DATA <= shift_register;
	end
	
end
*/	

// 0 - 511 counter

reg [8:0] count;

always @ (posedge CLOCK_IN)
begin	
	
	if (RESET)
	begin
		count<=0;
	end
	
	else if (ENABLE)
	begin
		if(count==1)
			begin
				count<=0;
			end
		else
			count<=count+1'b1;

		DATA <= count;
	end
end	
	

/*
// Simulador Noise with peak after 50 samples

reg [8:0] count;
reg [8:0] samples;

always @ (posedge CLOCK_IN)
begin	
	if(count== 4 || count == 511)
		begin
			count<=0;
	   end
	else
		count<=count+1'b1;
	
	
	samples <= samples +1'b1;
	
	if (samples == 100)
		begin
			count <= 511;
			samples <= 0;
		end
		
		
	DATA <= count;
end
*/
	
endmodule