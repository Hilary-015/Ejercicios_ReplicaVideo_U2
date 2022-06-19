----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:59:52 06/18/2022 
-- Design Name: 
-- Module Name:    TB_Memoria_Rom - Behavioral 
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

entity TB_Memoria_Rom is
end TB_Memoria_Rom;

architecture Behavioral of TB_Memoria_Rom is

component Memoria_Rom
	port(
		direccion: in STD_LOGIC_VECTOR(1 downto 0);
		salida: out STD_LOGIC_VECTOR(1 downto 0)
	);
end component;

--Entradas

signal direccion: STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

--Salidas

signal salida: STD_LOGIC_VECTOR(1 downto 0);

begin
	UUT: Memoria_Rom port map(
		salida => salida,
		direccion => direccion
	);
	
	stim_proc: process
	begin
		wait for 100 ns;
			direccion <= "01";
			wait for 100 ns;
			direccion <= "00";
			wait for 100 ns;
			direccion <= "11";
			wait for 100 ns;
			direccion <= "10";
		wait;
	end process;

end Behavioral;

