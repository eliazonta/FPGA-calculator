library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
  generic (
    counter_size : integer := 10
  );
  port (
    -- Inserire qui le dichiarazioni delle porte:
    -- * Un ingresso di clock "clock"
    clk : in std_logic;
    -- * Un ingresso di reset "reset"
    reset : in std_logic;
    -- * Un ingresso per il bottone "bouncy"
    bouncy : in std_logic;
    -- * Una uscita per l'impulse "pulse"
    pulse : out std_logic 
  );
end debouncer;

architecture behavioral of debouncer is

  -- Definizione dei segnali interni :
  -- * counter: tiene traccia dell'intervallo temporale in cui il segnale e' stabile
  signal counter : integer := counter_size;
  -- * candidate_value: tiene traccia del valore stabile candidato
  signal candidate_value : std_logic;
  -- * stable_value: tiene traccia del valore stabile attuale 
  signal stable_value : std_logic;

begin

  process ( clk, reset ) begin
    if reset = '1' then
        --reset di counter, stable_value, candidate_value
        counter <= counter_size;
        stable_value <= 0;
        candidate_value <= 0;

    elsif rising_edge( clk ) then
      -- Controlla se il segnale e' stabile
      if bouncy = candidate_value then
        -- Segnale stabile. Controlla per quanto tempo
        if counter = 0 then
          -- Aggiorna il valore stabile
          stable_value <= candidate_value;
        else
          -- Decrementa il contatore
          counter <= counter - 1;
        end if;
      else
        pulse <= '0';
            candidate_value <= bouncy;
        -- Segnale non stabile. Aggiorna il valore candidato e resetta il contatore
        
      end if;
    end if;
  end process;
  -- Genera impulso d'uscita
  pulse <= '1' when stable_value = bouncy else '0';

end behavioral;




--===============

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
generic (counter_size:integer:=3);
    Port(
        bouncy,reset,clk : in std_logic;
        pulse: out std_logic
    );
end debouncer;

architecture Behavioral of debouncer is
    signal counter: integer:=counter_size;
    signal candidate_value: std_logic;
    signal stable_value:std_logic;
    
begin
process(clk,reset)is
begin
    if reset='1' then
        counter<=counter_size;
        stable_value<='0';
        candidate_value<='0';
    elsif rising_edge(clk) then
        if bouncy=candidate_value then
            if counter=0 then
                stable_value<=candidate_value;
            else
                counter<=counter-1;
            end if;
        else
            candidate_value<=bouncy;
            counter<=counter_size;
        end if; 
    end if;
     
end process;
pulse <=stable_value;
end Behavioral;