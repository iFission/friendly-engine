/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     PIXEL_COUNT = 256
*/
module ledprocess_2 (
    input clk,
    input rst,
    input [255:0] map,
    input [7:0] win_pos,
    input [15:0] player_pos,
    output reg [7:0] pixel,
    output reg led,
    input update
  );
  
  localparam PIXEL_COUNT = 9'h100;
  
  
  localparam SEND_PIXEL_state = 1'd0;
  localparam RESET_state = 1'd1;
  
  reg M_state_d, M_state_q = SEND_PIXEL_state;
  reg [3:0] M_player_front_x_d, M_player_front_x_q = 1'h0;
  reg [3:0] M_player_back_x_d, M_player_back_x_q = 1'h0;
  reg [3:0] M_player_front_y_d, M_player_front_y_q = 1'h0;
  reg [3:0] M_player_back_y_d, M_player_back_y_q = 1'h0;
  reg [7:0] M_player_front_d, M_player_front_q = 1'h0;
  reg [7:0] M_player_back_d, M_player_back_q = 1'h0;
  reg [3:0] M_win_pos_x_d, M_win_pos_x_q = 1'h0;
  reg [3:0] M_win_pos_y_d, M_win_pos_y_q = 1'h0;
  reg [7:0] M_win_pos_xy_d, M_win_pos_xy_q = 1'h0;
  reg [7:0] M_pixel_ctr_d, M_pixel_ctr_q = 1'h0;
  reg [4:0] M_bit_ctr_d, M_bit_ctr_q = 1'h0;
  reg [5:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [11:0] M_rst_ctr_d, M_rst_ctr_q = 1'h0;
  reg [7:0] M_rel_front_d, M_rel_front_q = 1'h0;
  reg [7:0] M_rel_back_d, M_rel_back_q = 1'h0;
  
  reg [23:0] bitsR;
  
  reg [23:0] bitsG;
  
  reg [23:0] bitsB;
  
  reg [255:0] maplayout;
  
  always @* begin
    M_state_d = M_state_q;
    M_player_front_d = M_player_front_q;
    M_player_back_d = M_player_back_q;
    M_pixel_ctr_d = M_pixel_ctr_q;
    M_win_pos_xy_d = M_win_pos_xy_q;
    M_rst_ctr_d = M_rst_ctr_q;
    M_bit_ctr_d = M_bit_ctr_q;
    M_ctr_d = M_ctr_q;
    
    led = 1'h0;
    M_player_back_d = 4'hd;
    M_player_front_d = 5'h1d;
    M_win_pos_xy_d = 7'h42;
    bitsR = 24'hff0000;
    bitsG = 24'h00ff00;
    bitsB = 24'h0000ff;
    maplayout = {map[15+0-:1], map[14+0-:1], map[13+0-:1], map[12+0-:1], map[11+0-:1], map[10+0-:1], map[9+0-:1], map[8+0-:1], map[7+0-:1], map[6+0-:1], map[5+0-:1], map[4+0-:1], map[3+0-:1], map[2+0-:1], map[1+0-:1], map[0+0-:1], map[31+0-:1], map[30+0-:1], map[29+0-:1], map[28+0-:1], map[27+0-:1], map[26+0-:1], map[25+0-:1], map[24+0-:1], map[23+0-:1], map[22+0-:1], map[21+0-:1], map[20+0-:1], map[19+0-:1], map[18+0-:1], map[17+0-:1], map[16+0-:1], map[47+0-:1], map[46+0-:1], map[45+0-:1], map[44+0-:1], map[43+0-:1], map[42+0-:1], map[41+0-:1], map[40+0-:1], map[39+0-:1], map[38+0-:1], map[37+0-:1], map[36+0-:1], map[35+0-:1], map[34+0-:1], map[33+0-:1], map[32+0-:1], map[63+0-:1], map[62+0-:1], map[61+0-:1], map[60+0-:1], map[59+0-:1], map[58+0-:1], map[57+0-:1], map[56+0-:1], map[55+0-:1], map[54+0-:1], map[53+0-:1], map[52+0-:1], map[51+0-:1], map[50+0-:1], map[49+0-:1], map[48+0-:1], map[79+0-:1], map[78+0-:1], map[77+0-:1], map[76+0-:1], map[75+0-:1], map[74+0-:1], map[73+0-:1], map[72+0-:1], map[71+0-:1], map[70+0-:1], map[69+0-:1], map[68+0-:1], map[67+0-:1], map[66+0-:1], map[65+0-:1], map[64+0-:1], map[95+0-:1], map[94+0-:1], map[93+0-:1], map[92+0-:1], map[91+0-:1], map[90+0-:1], map[89+0-:1], map[88+0-:1], map[87+0-:1], map[86+0-:1], map[85+0-:1], map[84+0-:1], map[83+0-:1], map[82+0-:1], map[81+0-:1], map[80+0-:1], map[111+0-:1], map[110+0-:1], map[109+0-:1], map[108+0-:1], map[107+0-:1], map[106+0-:1], map[105+0-:1], map[104+0-:1], map[103+0-:1], map[102+0-:1], map[101+0-:1], map[100+0-:1], map[99+0-:1], map[98+0-:1], map[97+0-:1], map[96+0-:1], map[127+0-:1], map[126+0-:1], map[125+0-:1], map[124+0-:1], map[123+0-:1], map[122+0-:1], map[121+0-:1], map[120+0-:1], map[119+0-:1], map[118+0-:1], map[117+0-:1], map[116+0-:1], map[115+0-:1], map[114+0-:1], map[113+0-:1], map[112+0-:1], map[143+0-:1], map[142+0-:1], map[141+0-:1], map[140+0-:1], map[139+0-:1], map[138+0-:1], map[137+0-:1], map[136+0-:1], map[135+0-:1], map[134+0-:1], map[133+0-:1], map[132+0-:1], map[131+0-:1], map[130+0-:1], map[129+0-:1], map[128+0-:1], map[159+0-:1], map[158+0-:1], map[157+0-:1], map[156+0-:1], map[155+0-:1], map[154+0-:1], map[153+0-:1], map[152+0-:1], map[151+0-:1], map[150+0-:1], map[149+0-:1], map[148+0-:1], map[147+0-:1], map[146+0-:1], map[145+0-:1], map[144+0-:1], map[175+0-:1], map[174+0-:1], map[173+0-:1], map[172+0-:1], map[171+0-:1], map[170+0-:1], map[169+0-:1], map[168+0-:1], map[167+0-:1], map[166+0-:1], map[165+0-:1], map[164+0-:1], map[163+0-:1], map[162+0-:1], map[161+0-:1], map[160+0-:1], map[191+0-:1], map[190+0-:1], map[189+0-:1], map[188+0-:1], map[187+0-:1], map[186+0-:1], map[185+0-:1], map[184+0-:1], map[183+0-:1], map[182+0-:1], map[181+0-:1], map[180+0-:1], map[179+0-:1], map[178+0-:1], map[177+0-:1], map[176+0-:1], map[207+0-:1], map[206+0-:1], map[205+0-:1], map[204+0-:1], map[203+0-:1], map[202+0-:1], map[201+0-:1], map[200+0-:1], map[199+0-:1], map[198+0-:1], map[197+0-:1], map[196+0-:1], map[195+0-:1], map[194+0-:1], map[193+0-:1], map[192+0-:1], map[223+0-:1], map[222+0-:1], map[221+0-:1], map[220+0-:1], map[219+0-:1], map[218+0-:1], map[217+0-:1], map[216+0-:1], map[215+0-:1], map[214+0-:1], map[213+0-:1], map[212+0-:1], map[211+0-:1], map[210+0-:1], map[209+0-:1], map[208+0-:1], map[239+0-:1], map[238+0-:1], map[237+0-:1], map[236+0-:1], map[235+0-:1], map[234+0-:1], map[233+0-:1], map[232+0-:1], map[231+0-:1], map[230+0-:1], map[229+0-:1], map[228+0-:1], map[227+0-:1], map[226+0-:1], map[225+0-:1], map[224+0-:1], map[255+0-:1], map[254+0-:1], map[253+0-:1], map[252+0-:1], map[251+0-:1], map[250+0-:1], map[250+0-:1], map[248+0-:1], map[247+0-:1], map[246+0-:1], map[245+0-:1], map[244+0-:1], map[243+0-:1], map[242+0-:1], map[241+0-:1], map[240+0-:1]};
    pixel = M_pixel_ctr_q;
    
    case (M_state_q)
      SEND_PIXEL_state: begin
        if (M_player_front_q == 1'h0) begin
          M_player_front_d = 8'hff;
        end
        if (M_player_back_q < 5'h10) begin
          M_player_back_d = 4'hf - M_player_back_q;
        end else begin
          if (M_player_back_q < 6'h30 & M_player_back_q > 5'h1f) begin
            M_player_back_d = 6'h2f - M_player_back_q;
          end else begin
            if (M_player_back_q < 7'h50 & M_player_back_q > 6'h3f) begin
              M_player_back_d = 7'h4f - M_player_back_q;
            end else begin
              if (M_player_back_q < 7'h70 & M_player_back_q > 7'h5f) begin
                M_player_back_d = 7'h6f - M_player_back_q;
              end else begin
                if (M_player_back_q < 8'h90 & M_player_back_q > 7'h7f) begin
                  M_player_back_d = 8'h8f - M_player_back_q;
                end else begin
                  if (M_player_back_q < 8'hb0 & M_player_back_q > 8'h9f) begin
                    M_player_back_d = 8'haf - M_player_back_q;
                  end else begin
                    if (M_player_back_q < 8'hd0 & M_player_back_q > 8'hbf) begin
                      M_player_back_d = 8'hcf - M_player_back_q;
                    end else begin
                      if (M_player_back_q < 8'hf0 & M_player_back_q > 8'hdf) begin
                        M_player_back_d = 8'hef - M_player_back_q;
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if (M_player_front_q < 5'h10) begin
          M_player_front_d = 4'hf - M_player_front_q;
        end else begin
          if (M_player_front_q < 6'h30 & M_player_front_q > 5'h1f) begin
            M_player_front_d = 6'h2f - M_player_front_q;
          end else begin
            if (M_player_front_q < 7'h50 & M_player_front_q > 6'h3f) begin
              M_player_front_d = 7'h4f - M_player_front_q;
            end else begin
              if (M_player_front_q < 7'h70 & M_player_front_q > 7'h5f) begin
                M_player_front_d = 7'h6f - M_player_front_q;
              end else begin
                if (M_player_front_q < 8'h90 & M_player_front_q > 7'h7f) begin
                  M_player_front_d = 8'h8f - M_player_front_q;
                end else begin
                  if (M_player_front_q < 8'hb0 & M_player_front_q > 8'h9f) begin
                    M_player_front_d = 8'haf - M_player_front_q;
                  end else begin
                    if (M_player_front_q < 8'hd0 & M_player_front_q > 8'hbf) begin
                      M_player_front_d = 8'hcf - M_player_front_q;
                    end else begin
                      if (M_player_front_q < 8'hf0 & M_player_front_q > 8'hdf) begin
                        M_player_front_d = 8'hef - M_player_front_q;
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if (M_pixel_ctr_q == M_player_back_q || M_pixel_ctr_q == M_player_front_q) begin
          maplayout[(M_pixel_ctr_q)*1+0-:1] = 1'h0;
          if (bitsG[(M_bit_ctr_q)*1+0-:1]) begin
            led = M_ctr_q < 6'h2c;
          end else begin
            led = M_ctr_q < 4'hf;
          end
          M_ctr_d = M_ctr_q + 1'h1;
          if (M_ctr_q == 6'h37) begin
            M_ctr_d = 1'h0;
            M_bit_ctr_d = M_bit_ctr_q + 1'h1;
            if (M_bit_ctr_q == 5'h17) begin
              M_bit_ctr_d = 1'h0;
              M_pixel_ctr_d = M_pixel_ctr_q + 1'h1;
            end
          end
        end
        if (M_pixel_ctr_q == M_win_pos_xy_q) begin
          maplayout[(M_pixel_ctr_q)*1+0-:1] = 1'h0;
          if (bitsB[(M_bit_ctr_q)*1+0-:1]) begin
            led = M_ctr_q < 6'h2c;
          end else begin
            led = M_ctr_q < 4'hf;
          end
          M_ctr_d = M_ctr_q + 1'h1;
          if (M_ctr_q == 6'h37) begin
            M_ctr_d = 1'h0;
            M_bit_ctr_d = M_bit_ctr_q + 1'h1;
            if (M_bit_ctr_q == 5'h17) begin
              M_bit_ctr_d = 1'h0;
              M_pixel_ctr_d = M_pixel_ctr_q + 1'h1;
            end
          end
        end
        if (maplayout[(M_pixel_ctr_q)*1+0-:1]) begin
          if (bitsR[(M_bit_ctr_q)*1+0-:1]) begin
            led = M_ctr_q < 6'h2c;
          end else begin
            led = M_ctr_q < 4'hf;
          end
          M_ctr_d = M_ctr_q + 1'h1;
          if (M_ctr_q == 6'h37) begin
            M_ctr_d = 1'h0;
            M_bit_ctr_d = M_bit_ctr_q + 1'h1;
            if (M_bit_ctr_q == 5'h17) begin
              M_bit_ctr_d = 1'h0;
              M_pixel_ctr_d = M_pixel_ctr_q + 1'h1;
              if (M_pixel_ctr_q == 10'h0ff) begin
                M_pixel_ctr_d = 1'h0;
                M_state_d = RESET_state;
              end
            end
          end
        end
      end
      RESET_state: begin
        if ((&M_rst_ctr_q)) begin
          if (update) begin
            M_rst_ctr_d = 1'h0;
            M_state_d = SEND_PIXEL_state;
          end
        end else begin
          M_rst_ctr_d = M_rst_ctr_q + 1'h1;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_player_front_x_q <= 1'h0;
      M_player_back_x_q <= 1'h0;
      M_player_front_y_q <= 1'h0;
      M_player_back_y_q <= 1'h0;
      M_player_front_q <= 1'h0;
      M_player_back_q <= 1'h0;
      M_win_pos_x_q <= 1'h0;
      M_win_pos_y_q <= 1'h0;
      M_win_pos_xy_q <= 1'h0;
      M_pixel_ctr_q <= 1'h0;
      M_bit_ctr_q <= 1'h0;
      M_ctr_q <= 1'h0;
      M_rst_ctr_q <= 1'h0;
      M_rel_front_q <= 1'h0;
      M_rel_back_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_player_front_x_q <= M_player_front_x_d;
      M_player_back_x_q <= M_player_back_x_d;
      M_player_front_y_q <= M_player_front_y_d;
      M_player_back_y_q <= M_player_back_y_d;
      M_player_front_q <= M_player_front_d;
      M_player_back_q <= M_player_back_d;
      M_win_pos_x_q <= M_win_pos_x_d;
      M_win_pos_y_q <= M_win_pos_y_d;
      M_win_pos_xy_q <= M_win_pos_xy_d;
      M_pixel_ctr_q <= M_pixel_ctr_d;
      M_bit_ctr_q <= M_bit_ctr_d;
      M_ctr_q <= M_ctr_d;
      M_rst_ctr_q <= M_rst_ctr_d;
      M_rel_front_q <= M_rel_front_d;
      M_rel_back_q <= M_rel_back_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
