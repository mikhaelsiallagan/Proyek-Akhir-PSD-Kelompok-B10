library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Slot_Function.all;

entity tb_slotmachine is
end entity tb_slotmachine;

architecture rtl of tb_slotmachine is
    signal Top_up    : integer range 0 to 10000;
    signal reset       : std_logic;
    signal Get_Prize    : integer;

    component Data_input is
        port (
            Top_up : in integer range 0 to 10000;
            reset, CLK  : in std_logic;
    
            Get_Prize : out integer := 0
        );
    end component;
begin
    test : Data_Input
    port map (
        Top_up => Top_up,
        reset => reset,
        Get_Prize => Get_Prize
    );
end architecture;