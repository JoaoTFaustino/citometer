module CUMULATIVE_ADDER#(
	 parameter MAX_SAMPLES = 512,						// tamanho máximo do buffer
    parameter DWIDTH = 14,								// Largura de bits de dados de entrada
	 parameter THRESHOLD = 500//155000						// Threshold da soma
)(
    CLOCK,
    RESET,
	 ENABLE,
    DATA_IN,
	 CUSUM,
    TRIGGER
);

input CLOCK;
input RESET;
input ENABLE;
input [DWIDTH-1:0] DATA_IN;
output reg TRIGGER;
output reg [DWIDTH*2-1:0] CUSUM;

reg [DWIDTH*2-1:0] sum; 										// acumulador
reg [DWIDTH-1:0] delay_line [0:MAX_SAMPLES-1]; 			// buffer circular

integer i;
  
initial begin
	sum <= 0;
	
	for (i = 0; i < MAX_SAMPLES; i = i + 1) 
	begin
		delay_line[i] <= 0;
	end
end


always @(posedge CLOCK) 
begin
	if (RESET) 
	begin
		sum <= 0;
		
		for (i = 0; i < MAX_SAMPLES; i = i + 1) 
		begin
			delay_line[i] <= 0;
		end
	end 
	
	else if (ENABLE) 
	begin
		delay_line[0] <= DATA_IN;
		sum <= sum + DATA_IN - delay_line[MAX_SAMPLES-1];

		for (i = 1; i < MAX_SAMPLES; i = i + 1) 
		begin
			delay_line[i] <= delay_line[i-1];
		end
		
		if (sum > THRESHOLD)
		begin
			TRIGGER <= 1;
		end
		else
		begin
			TRIGGER <= 0;
		end
	
		CUSUM <= sum;
		
	end
end



endmodule
