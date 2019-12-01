module counter (            //counter with inversion method
    input clk,
    input rst,
    output reg [7:0] value  //output values declared as reg in verilog
  );
 
  reg[24:0] ctr_d, ctr_q;   //25 bit counter
 
  always @(ctr_q) begin
    ctr_d = ctr_q + 1'b1;
 
    if (ctr_q[24])
      value = ~ctr_q[23:16]; //top few bits of counter to verify that LED has fade in/out effect
    else
      value = ctr_q[23:16];
 
  end
 
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
  end
 
endmodule