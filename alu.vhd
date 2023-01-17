library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Definizione entita' ALU: gli ingressi devono tenere conto del segno!
entity alu is
    generic (nbit : integer := 32);
  Port (
    -- Inserire qui le dichiarazioni delle porte:
    -- * Un ingresso 31 bit signed "a"
    a : in signed(nbit downto 0);
    -- * Un ingresso 31 bit signed "b"
    b : in bit_vector(nbit downto 0);
    -- * 4 ingressi binari per la selezione dell'operazione "add, subtract, multiply, divide"
    add : in std_logic;
    subtract : in std_logic;
    multiply : in std_logic;

    -- * Una uscita 31 bit signed "r"
    r : out signed(31 downto 0);
  );
end alu;

-- Definizione architettura ALU
architecture Behavioral of alu is
  signal check : integer;
begin

  -- Processo viene eseguito ad ogni variazione su operandi e operazione selezionata
  process ( a, b, add, subtract, multiply ) begin
    r <= a;                        -- assegnazione di default
    if add = '1' then
      r <= a + b;
    elsif subtract = '1' then -- sottrazione 
        r <= a - b;
    elsif multiply = '1' then -- moltiplicazione 
        check <= to_integer(a * b);
        if(check < 2147483647) then
            r <= a * b;
        else 
        
    end if;
  end process;

end Behavioral;
