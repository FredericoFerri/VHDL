library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_adder_tb is
end ripple_adder_tb;


-- report "test_vector " & integer'image(i) & " failed " & 
   --    " for input a = " & integer'image(to_integer(unsigned(a))) & 
     --  " and b = " & integer'image(to_integer(unsigned(b))) &
       --" and sum = " & integer'image(to_integer(unsigned(sum)))
       --severity error;


architecture tb of ripple_adder_tb is
    
    signal a, b : std_logic_vector(1 downto 0); -- input
    signal  sum : std_logic_vector(2 downto 0); -- output

    -- declare record type
    type test_vector is record
        a, b : std_logic_vector(1 downto 0);
         sum : std_logic_vector(2 downto 0);
    end record; 

    type test_vector_array is array (natural range <>) of test_vector;
    constant test_vectors : test_vector_array := (
        -- a, b, sum , cout   -- positional method is used below
        ("00", "00","000"), 
        ("01", "00","001"),
        ("10", "00","010"),
        ("11", "00","011"),
        
        ("00", "01","001"),
        ("01", "01","010"),
        ("10", "01","011"),
        ("11", "01","100"),
        
        ("00", "10","010"),
        ("01", "10","011"),
        ("10", "10","100"),
        ("11", "10","101"),
        
        ("00", "11","011"),
        ("01", "11","100"),
        ("10", "11","101"),
        ("11", "11","110")
        );

begin
    UUT : entity work.ripple_adder port map (a => a, b => b, sum => sum);

    tb1 : process
    begin
        for i in test_vectors'range loop
            a <= test_vectors(i).a;  -- signal a = i^th-row-value of test_vector's a
            b <= test_vectors(i).b;
            
            wait for 20 ns;

            assert  (sum = test_vectors(i).sum)
                    
            -- image is used for string-representation of integer etc.
     report "test_vector " & integer'image(i) & " failed " & 
      " for input a = " & integer'image(to_integer(unsigned(a))) & 
       " and b = " & integer'image(to_integer(unsigned(b))) &
       " and sum = " & integer'image(to_integer(unsigned(sum)))
       severity error;
        end loop;
        wait;
    end process; 

end tb;

