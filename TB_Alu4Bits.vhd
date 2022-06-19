----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:41:32 06/18/2022 
-- Design Name: 
-- Module Name:    TB_Alu4Bits - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Alu4Bits is
end TB_Alu4Bits;

architecture Behavioral of TB_Alu4Bits is

component Alu4Bits is 
	port(
		A,B: in STD_LOGIC_VECTOR(3 downto 0);
		opc: in STD_LOGIC_VECTOR(2 downto 0);
		
		cout: out STD_LOGIC;
		yout: out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

signal A: STD_LOGIC_VECTOR(3 downto 0) := "1011";
signal B: STD_LOGIC_VECTOR(3 downto 0) := "1001";
signal opc: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
signal cout: STD_LOGIC := '0';
signal result: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

	UUT: Alu4Bits port map(A, B, opc, cout, result);
	A <= "1100" after 80 ns;
	B <= "1010" after 80 ns; 
	opc <= opc + '1' after 10 ns;

end Behavioral;

