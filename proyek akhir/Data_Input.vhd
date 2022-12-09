library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.math_real.uniform;

use work.Slot_Function.all;

entity Data_Input is
    port (
        Top_up : in integer range 0 to 10000;
        reset, CLK  : in std_logic;

        Get_Prize : out integer := 0
    );
end entity Data_Input;

architecture rtl of Data_Input is
    type state is (S0, S1, S2, S3);
        signal Present : state;
        signal Next_State : state;
        --S0, menu untuk top-up dan tukar koin (tombol play gak muncul)
        --S1, menu jika Coin != 0 (tombol play muncul)
        --S2, start slot, dan menambah gain
        --S3, menu akhir (mau ngulang game, top up lagi, atau berhenti)
        --S4, slot machine ke-restart

    
    -- variable len : integer := 2;
    signal Slot1, Slot2, Slot3 : std_logic_vector(2 downto 0);

begin
    --menentukan state
    process(Present, CLK)
begin
    if(rising_edge(CLK)) then 
        Present <= Next_State;
    elsif(reset = '1') then 
        Present <= S3;
    end if;
end process;

    --Main process
    process (Present, CLK, Slot1, Slot2, Slot3)
        variable costCoin : integer := 1000; --harga/coin
        variable Gain : integer := 0; --perolehan hadiah
        variable Coin : integer := 0; --jumlah coin
        variable Balance : integer; --untuk top-up

        variable acak1 : positive := 4;
        variable acak2 : positive := 7;
        variable acak3 : positive := 11;
    
    begin
        Balance := Top_up;
            case Present is
                when S0 =>
                if (Balance > 0) then
                    Coin := Balance / costCoin;
                    Gain := Gain + Balance mod costCoin;
                    Balance := 0;
                    Next_State <= S0;
                    
                else
                    if(Coin <= 0) then
                        Coin := 0;
                        Next_State <= S3;
                    else 
                        acak1 := acak1 + gain;
                        acak2 := acak2 + acak1 + Coin;
                        acak3 := acak3 + acak2 + acak1 + Coin + gain;
                        Next_State <= S1;
                    end if;
                end if;

                when S1 =>
                    Slot1 <= rand(acak1, acak2);
                    Slot2 <= rand(acak2, acak3);
                    Slot3 <= rand(acak3, acak1);
                    Next_State <= S2;
                    
                when S2 =>
                    Coin := Coin - 1;
                    report "Gain saat ini : " & integer'image(Gain);
                    report "Sisa Coin anda : " & integer'image(Coin);
                    Gain := Gain + conclusion(checking(Slot1, Slot2, Slot3)); -- output integer
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
