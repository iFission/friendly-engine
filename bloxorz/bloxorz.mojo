<?xml version="1.0" encoding="UTF-8"?>
<project name="bloxorz" board="Mojo V3" language="Lucid">
  <files>
    <src>led_lookup.luc</src>
    <src>alu16.luc</src>
    <src>alu16_shift.luc</src>
    <src>alu16_add.luc</src>
    <src>game_regfile.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>ws2812b.luc</src>
    <src>game.luc</src>
    <src>alu16_bool.luc</src>
    <src>alu16_tester.luc</src>
    <src>alu16_cmp.luc</src>
    <src>game_control_unit.luc</src>
    <src>game_map.luc</src>
    <src>led_grid.luc</src>
    <ucf>led.ucf</ucf>
    <ucf>buttons.ucf</ucf>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
