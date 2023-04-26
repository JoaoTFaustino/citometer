module THDB_ADA (
	CLOCK_50,
	CLOCK_65,
	ADC_CLK_A,
	ADC_CLK_B,
	ADC_DA,
	ADC_DB,
	ADC_OEB_A,
	ADC_OEB_B,
	ADC_OTR_A,
	ADC_OTR_B,
	DAC_CLK_A,
	DAC_CLK_B,
	DAC_DA,
	DAC_DB,
	DAC_MODE,
	DAC_WRT_A,
	DAC_WRT_B,
	OSC_SMA_ADC4,
	POWER_ON,
	SMA_DAC4
);
                        
                        
input		          		CLOCK_50;
input							CLOCK_65;

output		          	ADC_CLK_A;
output		          	ADC_CLK_B;
input		    [13:0]		ADC_DA;
input		    [13:0]		ADC_DB;
output		          	ADC_OEB_A;
output		          	ADC_OEB_B;
input		          		ADC_OTR_A;
input		          		ADC_OTR_B;
output		          	DAC_CLK_A;
output		          	DAC_CLK_B;
output		 [13:0]		DAC_DA;
output		 [13:0]		DAC_DB;
output		          	DAC_MODE;
output		          	DAC_WRT_A;
output		          	DAC_WRT_B;
output		        		POWER_ON;
output                  OSC_SMA_ADC4;
output                  SMA_DAC4;
//=======================================================
//  REG/WIRE declarations
//=======================================================

assign  DAC_WRT_B = ~CLOCK_65;      	//Input write signal for PORT B
assign  DAC_WRT_A = ~CLOCK_65;      	//Input write signal for PORT A

assign  DAC_MODE = 1; 		       		//Mode Select. 1 = dual port, 0 = interleaved.

assign  DAC_CLK_B = ~CLOCK_65; 	    	//PLL Clock to DAC_B
assign  DAC_CLK_A = ~CLOCK_65; 	    	//PLL Clock to DAC_A
 
assign  ADC_CLK_B = ~CLOCK_65;  	    	//PLL Clock to ADC_B
assign  ADC_CLK_A = ~CLOCK_65;  	   	//PLL Clock to ADC_A

assign  ADC_OEB_A = 0; 		  	  			//ADC_OEA 0 - enable
assign  ADC_OEB_B = 0; 			  			//ADC_OEB
assign  POWER_ON  = 1;          			//Disable OSC_SMA

assign  DAC_DA = ADC_DA; 					//B
assign  DAC_DB = ADC_DA; 					//A

assign  POWER_ON  = 1;           		//Disable OSC_SMA

reg		 [13:0]		r_ADC_DA;			//synthesis noprune
reg		 [13:0]		r_ADC_DB;			//synthesis noprune

always @ (posedge CLOCK_65) r_ADC_DA <= ADC_DA;
always @ (posedge CLOCK_65) r_ADC_DB <= ADC_DB;


/*
assign  DAC_WRT_B = ~CLK_125;      //Input write signal for PORT B
assign  DAC_WRT_A = ~CLK_125;      //Input write signal for PORT A

assign  DAC_MODE = 1; 		       //Mode Select. 1 = dual port, 0 = interleaved.

assign  DAC_CLK_B = ~CLK_125; 	    //PLL Clock to DAC_B
assign  DAC_CLK_A = ~CLK_125; 	    //PLL Clock to DAC_A
 
assign  ADC_CLK_B = ~CLK_65;  	    //PLL Clock to ADC_B
assign  ADC_CLK_A = ~CLK_65;  	    //PLL Clock to ADC_A


assign  ADC_OEB_A = 0; 		  	    //ADC_OEA


*/
/////////////////////////////////////
/*
assign  DAC_DA = comb; //B
assign  DAC_DB = comb; //A

assign  POWER_ON  = 1;            //Disable OSC_SMA

reg		 [13:0]		r_ADC_DA//synthesis noprune;
reg		 [13:0]		r_ADC_DB//synthesis noprune;

always @ (posedge CLK_65) r_ADC_DA <= ADC_DA;
always @ (posedge CLK_65) r_ADC_DB <= ADC_DB;
*/
endmodule