----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:40:08 06/18/2022 
-- Design Name: 
-- Module Name:    TB_Memoria_Ram - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Memoria_Ram is
end TB_Memoria_Ram;

architecture Behavioral of TB_Memoria_Ram is

    component Memoria_Ram
    PORT(
         clk : IN  std_logic;
         entrada : IN  std_logic_vector(1 downto 0);
         direccion : IN  std_logic_vector(1 downto 0);
         CE : IN  std_logic;
         OE : IN  std_logic;
         WE : IN  std_logic;
         salida : OUT  std_logic_vector(1 downto 0)
        );
    end component;
    

   --Entradas
   signal clk : std_logic := '0';
   signal entrada : std_logic_vector(1 downto 0) := (others => '0');
   signal direccion : std_logic_vector(1 downto 0) := (others => '0');
   signal CE : std_logic := '0';
   signal OE : std_logic := '0';
   signal WE : std_logic := '0';

 	--Salidas
   signal salida : std_logic_vector(1 downto 0);

   -- 
   constant clk_period : time := 10 ns;
 
begin

   UUT: Memoria_Ram port map (
          clk => clk,
          entrada => entrada,
          direccion => direccion,
          CE => CE,
          OE => OE,
          WE => WE,
          salida => salida
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   stim_proc: process
   begin		
      CE <= '0';
		WE <= '0';
		OE <= '1';
		entrada <= "11";
		direccion <= "00";
      wait for clk_period;
		WE <= '1';
		OE <= '0';
		direccion <= "00";		
      wait;
   end process;
end Behavioral;

