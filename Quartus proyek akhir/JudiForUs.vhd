library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.math_real.uniform;

use work.Slot_Function.all;

entity JudiForUs is
    port (
        Top_up : in integer range 0 to 10000;
        reset, CLK  : in std_logic;

        Get_Prize : out integer := 0
    );
end entity JudiForUs;

architecture rtl of JudiForUs is
    type state is (S0, S1, S2, S3);
        signal Present : state;
        signal Next_State : state;
        --S0, menu untuk top-up dan tukar koin (tombol play gak muncul)
        --S1, menu jika Coin != 0 (tombol play muncul)
        --S2, start slot, dan menambah gain
        --S3, menu akhir (mau ngulang game, top up lagi, atau berhenti)
        --S4, slot machine ke-restart

    
    -- variable len : integer := 2;
    type game is array(2 downto 0) of std_logic_vector(2 downto 0);
        signal Slot : game;
    signal see_coin : integer := 0;
    signal see_gain : integer := 0;


begin
    --Clock process
    process(Present, CLK)
    begin
    if(reset = '1') then
		Present <= S3;
    elsif(rising_edge(CLK)) then
		  Present <= Next_State;
    end if;
    end process;

    --Main process
    process (Present, CLK)
        variable costCoin : integer := 1000; --harga/coin

        variable acak1 : positive := 4;
        variable acak2 : positive := 7;
        variable acak3 : positive := 11;
        
        variable Balance : integer; --untuk top-up
        variable Coin : integer := 0; --jumlah coin
        variable Gain : integer := 0; --perolehan hadiah
        

    begin

        if(Present = S2) then
            Coin := Coin - 1;
            Gain := Gain + conclusion(checking(Slot(0), Slot(1), Slot(2))); -- output integer
            report "Coin anda saat ini : " & integer'image(Coin/3);
            report "Gain yang telah didapat" & integer'image(Gain/3);
        end if;

        Balance := Top_up;
            case Present is
                when S0 =>
                if (Balance > 0) then
                    Coin := Balance / costCoin * 3;
                    Gain := Gain + Balance mod costCoin;
                    Balance := 0;
                    Next_State <= S0;
                    
                else
                    if(Coin <= 0) then
                        Coin := 0;
                        Next_State <= S3;
                    else
                        Next_State <= S1;
                    end if;
                end if;

                when S1 =>
                    Slot(0) <= rand(acak2, acak1);
                    Slot(1) <= rand(acak3, acak2);
                    Slot(2) <= rand(acak2, acak3);
                    Next_State <= S2;
                    
                when S2 =>
                    acak1 := acak1 + acak2;
                    acak2 := acak2 + acak3;
                    acak3 := acak3 + 19;

                    see_coin <= Coin / 3;
                    see_gain <= Gain / 3;
                    Next_State <= S0;
                
                when others =>
                    Coin := 0;
                    Balance := 0;
                    Next_State <= S0;
                    Get_Prize <= Gain;
                    report "Terima kasih telah bermain";
                    report "Gain didapatkan : " & integer'image(Gain);
            end case;
    end process;
end architecture;