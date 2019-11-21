/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_19 (
    input clk,
    input rst,
    input [15:0] player_position_in,
    output reg [15:0] player_position_out
  );
  
  
  
  reg [15:0] M_player_position_d, M_player_position_q = 1'h0;
  
  always @* begin
    M_player_position_d = M_player_position_q;
    
    M_player_position_d = player_position_in;
    player_position_out = M_player_position_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_player_position_q <= 1'h0;
    end else begin
      M_player_position_q <= M_player_position_d;
    end
  end
  
endmodule