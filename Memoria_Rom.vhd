----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:19 06/18/2022 
-- Design Name: 
-- Module Name:    Memoria_Rom - Behavioral 
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

entity Memoria_Rom is
	port(
		direccion: in STD_LOGIC_VECTOR(1 downto 0);
		salida: out STD_LOGIC_VECTOR(1 downto 0)
	);
end Memoria_Rom;

architecture Behavioral of Memoria_Rom is

	type datos is array (0 to 3) of STD_LOGIC_VECTOR(1 downto 0);
	constant rom : datos := (
		"11", "10", "00", "01"
	);

begin

	salida <= rom(to_integer(unsigned(direccion)));

end Behavioral;

