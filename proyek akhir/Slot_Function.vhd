library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package Slot_Function is
    --fungsi menghasilkan nilai random
    impure function rand(seed1, seed2 : positive) return std_logic_vector;
    --fungsi checking mengecek kemenangan
    function checking(sym1, sym2, sym3 : std_logic_vector(2 downto 0)) return integer;
    --menentukan jumlah hadiah
    function conclusion(checker : integer) return positive;

end package Slot_Function;
    
package body Slot_Function is
   --body fungsi rand
   impure function rand(seed1, seed2 : positive) return std_logic_vector is
    variable r : real;
    variable cek1 : positive := seed1;
    variable cek2 : positive := seed2;
    variable slv : std_logic_vector(2 downto 0);

    begin
    for i in 0 to 2 loop
        uniform(cek1, cek2, r);
        if(r > 0.5) then 
            slv(i) := '1';
        else
            slv(i) := '0';
        end if;
    end loop;
        return slv;
    end function rand; 

    function checking(sym1, sym2, sym3 : std_logic_vector(2 downto 0)) return integer is
        variable hasil : integer;
    begin
        if (sym1 = sym2) then
            hasil := to_integer(unsigned(sym1));
        elsif(sym1 = sym3) then
            hasil := to_integer(unsigned(sym1));
        elsif(sym2 = sym3) then 
            hasil := to_integer(unsigned(sym2));
        elsif((sym1 = sym2) = (sym1 = sym3)) then
            hasil := -1 * to_integer(unsigned(sym1));
        else
            hasil := 0;
        end if;
        return hasil;
    end function checking;

    function conclusion(checker : integer) return integer is 
        variable endpoint : integer := 500;
    begin
        case checker is
            when -7     => endpoint := endpoint * 100;  report "Jackpot"& " Get : " &integer'image(endpoint);
            when -6     => endpoint := endpoint * 10;   report "Fortune on you"& " Get : " &integer'image(endpoint);
            when -5     => endpoint := endpoint * 4;    report "Nice Luck"& " Get : " &integer'image(endpoint);
            when -4     => endpoint := endpoint * 3;    report "Impressive"& " Get : " &integer'image(endpoint);
            when -3     => endpoint := endpoint * 3;    report "Nice"& " Get : " &integer'image(endpoint);
            when -2     => endpoint := endpoint * 2;    report "Good start"& " Get : " &integer'image(endpoint);
            when -1     => endpoint := endpoint * 2;    report "Good start"& " Get : " &integer'image(endpoint);
            when 0      => endpoint := endpoint * 0;    report "Try again"& " Get : " &integer'image(endpoint);
            when 1      => endpoint := endpoint * 1;    report "Try again"& " Get : " &integer'image(endpoint);
            when 2      => endpoint := endpoint * 1;    report "Wish you luck on another chance"& " Get : " &integer'image(endpoint);
            when 3      => endpoint := endpoint * 1;    report "Wish you luck on another chance"& " Get : " &integer'image(endpoint);
            when 4      => endpoint := endpoint * 2;    report "Good start" & " Get : " &integer'image(endpoint);
            when 5      => endpoint := endpoint * 2;    report "Good start"& " Get : " &integer'image(endpoint);
            when 6      => endpoint := endpoint * 3;    report "Good start"& " Get : " &integer'image(endpoint);
            when 7      => endpoint := endpoint * 4;    report "Already near"& " Get : " &integer'image(endpoint);
            when others => report "Machine error";
        end case;
            return endpoint;    
    end function conclusion;
end package body;