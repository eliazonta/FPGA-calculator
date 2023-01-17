library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity debouncer_testbench is
end debouncer_testbench;

architecture Behavioral of debouncer_testbench is

component debouncer
  generic (
    counter_size : integer := 10
  );
  port (
    clk, reset : in std_logic;
    bouncy : in std_logic;
    pulse : out std_logic
  );
end component;

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal bouncy : std_logic := '0';
signal pulse : std_logic := '0';

begin

   uut : debouncer
   port map(
      clk  => clk,
      reset  => reset,
      bouncy => bouncy,
      pulse   => pulse
   );

   clk <= not(clk) after 5 ns;

   test_proc : process
   begin

      reset <= '0';
      wait for 10 ns;
      reset <= '1';
      wait for 10 ns;

      bouncy <= '0';
      wait for 10 ns;

      bouncy <= '1';
      wait for 10 ns;

      bouncy <= '0';
      wait for 10 ns;

      bouncy <= '1';
      wait for 15 us;

      bouncy <= '0';
      wait for 10 ns;

      bouncy <= '1';
      wait for 45 us;

      bouncy <= '0';
      wait for 100 ns;

   wait;
   end process;

end Behavioral;


--======================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity debouncer_testbench is
--  Port ( );
end debouncer_testbench;

architecture Behavioral of debouncer_testbench is

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal bouncy : std_logic := '0';
signal pulse : std_logic := '0';

begin

   uut : entity work.debouncer
   port map(
      clk  => clk,
      reset  => reset,
      bouncy => bouncy,
      pulse   => pulse
   );

   clk <= not(clk) after 5 ns;

   uut_test_proc : process
   begin
      reset <= '1';
      wait for 10 ns;
      reset <= '0';
      wait for 10 ns;

      bouncy <= '0';
      wait for 10 ns;

      bouncy <= '1';
      wait for 10 ns;

      bouncy <= '0';
      wait for 10 ns;

      bouncy <= '1';
      wait for 40 ns;

      bouncy <= '0';
      wait for 10 ns;

      bouncy <= '1';
      wait for 100 ns;

      bouncy <= '0';
      wait for 100 ns;

   wait;
   end process;

end Behavioral;