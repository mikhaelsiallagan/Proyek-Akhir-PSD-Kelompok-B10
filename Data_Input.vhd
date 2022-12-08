library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.Slot_Function.all;

entity Data_Input is
    port (
        amount : in integer range 1000 to 10000;
        coin_conv : in integer range 1 to 10;
        selection : in std_logic_vector(1 to 0);
        clk, reset, automatic   : in std_logic;

        Slot_end : out std_logic
    );
end entity Data_Input;

architecture rtl of Data_Input is
    type state is (S0, S1, S2, S3, S4, S5);
        signal Present, Next_State : state;
        --S0, menu untuk top-up dan tukar coin (tombol play gak muncul)
        --S1, menu jika Coin != 0 (tombol play muncul)
        --S2, start slot, dan menambah gain
        --S3, menu akhir (mau ngulang game, top up lagi, atau berhenti)
        --S4, slot machine ke-restart

    variable coin : integer := 1000;
    variable Balance : integer := 0;
    variable Gain : integer := 0;
    variable jmlCoin : integer := 0;
    signal top_Up, tradeC : std_logic;
    signal Keluar : std_logic;
    signal Slot1, Slot2, Slot3 : std_logic_vector(2 downto 0);

begin
    process (Present, Next_State)
    begin
        case Present is
            when S0 =>
            Keluar <= '0';
            if(selection = "00") then 
                Balance := Balance + amount;
                Next_State <= S0;

            elsif(selection = "01") then 
                if(Balance < coin_conv*coin) then 
                    report "Uang tidak cukup untuk membeli coin";
                    Next_State <= S0;
                else 
                    Balance := Balance - coin_conv*coin;
                    Next_State <= S0;
                end if;

            elsif (selection = "10") then
                Coin := Coin - 1;
                Next_State <= S1;
    
            else
                Keluar <= '0';
                report "Terima kasih telah bermain";
                report "Gain didapatkan : " & integer'image(Gain);
                Next_State <= S3;
            end if;
                    
            when S1 =>
                Keluar <= '0';
                Slot1 <= rand(3);
                Slot2 <= rand(3);
                Slot3 <= rand(3);
                Next_State <= S2;

            when S2 =>                
                
        
            when others =>
                null;
        end case;
     if (Balance < (jmlCoin*coin)) then
        
     end if;   
    end process;

    assert (Balance < (jmlCoin*coin))
        report "Balance kurang, mohon top up ulang"
        severity note;
    
    assert (Balance = 0)
        report "Mohon topup"
        severity note;
    

end architecture;