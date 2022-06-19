----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:37:06 06/18/2022 
-- Design Name: 
-- Module Name:    Memoria_Ram - Behavioral 
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memoria_Ram is
	Port(
		clk: in STD_LOGIC;
		entrada, direccion: in STD_LOGIC_VECTOR(1 downto 0);
		CE, OE, WE: in STD_LOGIC;
		salida: out STD_LOGIC_VECTOR(1 downto 0)
	);
end Memoria_Ram;

architecture Behavioral of Memoria_Ram is

type datos is array (0 to 3) of STD_LOGIC_VECTOR(1 downto 0);
signal signalDatos : datos;
begin
process(clk)
begin
	if CE = '0' then
		if (clk'event and clk='1') then
			if WE = '0' then
				signalDatos(to_integer(unsigned(direccion))) <= entrada;
			else
				salida <= signalDatos(to_integer(unsigned(direccion)));
			end if;
		end if;
	end if;
end process;

end Behavioral;
