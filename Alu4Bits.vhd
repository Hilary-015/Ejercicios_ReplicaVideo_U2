----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:51 06/18/2022 
-- Design Name: 
-- Module Name:    Alu4Bits - Behavioral 
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

entity Alu4Bits is
	port(
		A,B: in STD_LOGIC_VECTOR(3 downto 0);
		opc: in STD_LOGIC_VECTOR(2 downto 0);
		
		cout: out STD_LOGIC;
		yout: out STD_LOGIC_VECTOR(3 downto 0)
	);

end Alu4Bits;	

architecture Behavioral of Alu4Bits is

	signal tmp: STD_LOGIC_VECTOR(4 downto 0):= (others => '0');
begin
	--Operaciones logicas
	with opc(2 downto 0) select
		tmp <= ('0' & A) when "000",
				 ('0' & B) when "001",
				 ('0' & A) and ('0' & B) when "010",
				 ('0' & A) or ('0' & B) when "011",
	--Operaciones aritmeticas
			    ('0' & A) + B when "100",		
				 ('0' & A) + '1' when "101",	
				 ('0' & A) - '1' when "110",
				 ('0' & A) - B when others;
	cout <= tmp(4);
	yout <= tmp (3 downto 0);

end Behavioral; 

