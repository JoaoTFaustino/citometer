module LED_UPDATER(
	CLOCK_IN,
	RESET,
	DATA,
	ENABLE,
	TRIGGER
);

			
input 					CLOCK_IN;
input 					RESET;
input						ENABLE;
output	reg [8:0]	DATA;
output					TRIGGER;

assign TRIGGER = (DATA==9'b111111111) ? 1'b1 : 1'b0;

reg	direction;

initial begin
	DATA<={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	direction <= 1'b0;
end


always @ (posedge CLOCK_IN)
begin	
	if (RESET)
	begin
		DATA <= 9'b000000000;
		direction <= 1'b0;
	end
	
	else if (ENABLE)
	begin
	
		if (direction == 1'b0)
		begin
			if (DATA == 9'b111111111)
			begin
				direction <= 1'b1;
			end
			else
			begin
				DATA <= DATA + 1'b1;
			end
		end
		
		else
		begin
			if (DATA == 0)
			begin
				direction <= 1'b0;
			end
			else
			begin
				DATA <= DATA - 1'b1;
			end
		end
		
	end

end
		
			
			
endmodule