library ieee;
use ieee.std_logic_1164.all;
 
entity full_adder is
  port (
    a, b, cin : in std_logic;
    sum, cout : out std_logic
    );
end full_adder;
 
architecture rtl of full_adder is
    signal xab : std_logic;
begin
    xab <= a xor b;
    sum <= xab xor cin;
    cout <= (xab and cin) or (a and b);
end rtl;

