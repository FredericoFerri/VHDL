library ieee;
use ieee.std_logic_1164.all;
 
entity ripple_adder is
  port (
    a, b : in std_logic_vector(1 downto 0);
    sum : out std_logic_vector(2 downto 0)
    );
end ripple_adder;
 
 
architecture rtl of ripple_adder is

component full_adder is
  port (
    a, b, cin : in std_logic;
    sum, cout : out std_logic
    );
end component;

    signal xab : std_logic;
    signal carry : std_logic;
    
begin
	
    add0:full_adder port map (a => a(0), b => b(0), cin => '0', cout => carry, sum =>sum(0) );
	add1:full_adder port map (a => a(1), b => b(1), cin => carry, cout=>sum(2), sum => sum(1) );
   
end rtl;

