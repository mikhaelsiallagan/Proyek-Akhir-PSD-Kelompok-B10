library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package Slot_Function is
    --fungsi menghasilkan nilai random
    function rand(len : integer) return std_logic;
    function checking(sym1, sym2, sym3 : std_logic_vector(2 downto 0)) return integer;

end package Slot_Function;
    
package body Slot_Function is
   --body fungsi rand
   function rand(signal len : integer) return std_logic_vector is
    variable seed1, seed2 : positive := 90;
    variable r : real;
    variable slv : std_logic_vector(len-1 downto 0);

    begin
    for i in 0 to slv'length loop
        uniform(seed1, seed2, r);
        slv(i) := '1' when r > 0.5 else '0';
    end loop;
        return slv;
        assert (slv <= not null) report "random number is " & std_logic_vector'image(slv);
        
    end rand; 

    function checking(sym1, sym2, sym3 : std_logic_vector(2 downto 0)) return integer is
        signal hasil : integer;
    begin
        if ((sym1 and sym2) or (sym1 and sym3) or (sym2 and sym3)) then
            hasil <= 1;
        elsif(sym1 and sym2 and sym3) then
            hasil <= 2;
        else
            hasil <= 0;
        end if;
    end checking;
end package body;
