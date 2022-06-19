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
	port(
		clk: in STD_LOGIC;
		entrada: in STD_LOGIC_VECTOR(1 downto 0);
		direccion: in STD_LOGIC_VECTOR(1 downto 0);
		CE: in STD_LOGIC;
		OE: in STD_LOGIC;
		WE: in STD_LOGIC;
		salida: out STD_LOGIC_VECTOR(1 downto 0)
	);
end component;

--Entradas
signal clk: STD_LOGIC := '0';
signal entrada: STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal direccion: STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
signal CE: STD_LOGIC := '0';
signal OE: STD_LOGIC := '0';
signal WE: STD_LOGIC := '0';

--Salidas
signal salida: STD_LOGIC_VECTOR(1 downto 0);

--Clock
constant clk_period: time := 10 ns;

begin

UUT: Memoria_Ram port map(
	clk => clk,
	entrada => entrada,
	direccion => direccion,
	CE => CE,
	OE => OE,
	WE => WE,
	salida => salida
);

clk_process : process
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
			salida <= "00";
		wait for clk_period;
			WE <= '1';
			OE <= '0';
			direccion <= "00";
		wait;
end process;
		
end Behavioral;

