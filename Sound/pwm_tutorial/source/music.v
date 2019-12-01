module music(clk, speaker); //16 bit counter 25MHz clk oscillator. Highest bit toggle 25M/65536=381Hz
  input clk;
  output speaker;

// first create a 16bit binary counter
reg [15:0] counter;
always @(posedge clk) counter <= counter+1;

// and use the most significant bit (MSB) of the counter to drive the speaker
assign speaker = counter[15];
endmodule
