----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:11 06/18/2022 
-- Design Name: 
-- Module Name:    TB_AluBits - Behavioral 
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

entity TB_AluBits is
end TB_AluBits;

architecture Behavioral of TB_AluBits is

component AluBits is
	port(
		a_i: in STD_LOGIC_VECTOR(7 downto 0);
		b_i: in STD_LOGIC_VECTOR(7 downto 0);
		opc_i: in STD_LOGIC_VECTOR(1 downto 0);
		d_o: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

signal a_s: STD_LOGIC_VECTOR(7 downto 0);
signal b_s: STD_LOGIC_VECTOR(7 downto 0);
signal opc_s: STD_LOGIC_VECTOR(1 downto 0);
signal d_s: STD_LOGIC_VECTOR(7 downto 0);
 
begin

UUT: AluBits port map(a_s, b_s, opc_s, d_s);

a_s <= "00010001", "01100101" after 5 ns;
b_s <= "00100011", "00000010" after 5 ns, "00111001" after 20 ns;
opc_s <= "00", "01" after 5 ns;
 
end Behavioral;
 
