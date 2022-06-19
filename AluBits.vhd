----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:38 06/18/2022 
-- Design Name: 
-- Module Name:    AluBits - Behavioral 
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

entity AluBits is
    Port ( a_i : in  STD_LOGIC_VECTOR (7 downto 0);
           b_i : in  STD_LOGIC_VECTOR (7 downto 0);
           opc_i : in  STD_LOGIC_VECTOR (1 downto 0);
           d_o: out  STD_LOGIC_VECTOR (7 downto 0));
end AluBits;

architecture Behavioral of AluBits is

begin
	process(a_i, b_i, opc_i)
		begin
			case opc_i is
			when "00" =>
				d_o <= STD_LOGIC_VECTOR(unsigned(a_i) + unsigned(b_i));
			when "01" =>
				d_o <= STD_LOGIC_VECTOR(unsigned(a_i) - unsigned(b_i));
			when "10" =>
				d_o <= a_i and b_i;
			when others =>
				d_o <= a_i or b_i; 
			end case;
	end process;  
 
end Behavioral;

