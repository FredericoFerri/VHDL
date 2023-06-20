library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity register_bench_32 is
    port(
        enable_w,CLK,CLR  : in std_logic;
        addr1             : in std_logic_vector(4 downto 0);
        addr2             : in std_logic_vector(4 downto 0);
        addr3             : in std_logic_vector(4 downto 0);
        input_memory      : in std_logic_vector(31 downto 0);
        output_A          : out std_logic_vector(31 downto 0);
        output_B          : out std_logic_vector(31 downto 0)
    );
end register_bench_32;

architecture arch_reg of register_bench_32 is

--instanciação do banco de registradores 
    type array_reg is array (0 to 31) of std_logic_vector(31 downto 0);
    
    signal b_reg : array_reg := (others => (others => '0'));
        
    begin
        process (CLR, CLK, enable_w)
        begin
            if CLR = '0' then 
                b_reg <= (others => (others => '0'));

            elsif rising_edge(CLK) then 
                if enable_w = '1' then 
                    b_reg(to_integer(unsigned(addr3))) <= input_memory;
                end if;
            end if;
        end process;
		
        
        output_A <= b_reg(to_integer(unsigned(addr1))) when addr1 /= "00000" 
        else (others => '0');
        output_B <= b_reg(to_integer(unsigned(addr2))) when addr2 /= "00000" 
        else (others => '0');
        
end arch_reg;

