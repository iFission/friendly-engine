module music_Anote(clk, speaker);//440Hz -> 25MHz/56818
input clk;
output speaker;

reg [14:0] counter;
always @(posedge clk) 
  if(counter==28408) counter<=0;
  
  else counter <= counter+1; // use 56818/2 to get duty cycle of 50%, else would be 42%

reg speaker;

always @(posedge clk) 
  if(counter==28408) speaker <= ~speaker;

endmodule