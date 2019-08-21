-- test file for SIPO shift register

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity test_shift_reg is
end;

architecture test of test_shift_reg is
component Shift_register
	Port ( A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           data_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end component;

signal data_in : std_logic := '0';
signal reset : std_logic := '0';
signal clk : std_logic := '0';
signal A, B, C, D : std_logic;

begin
	dev_to_test : Shift_register
		port map(A, B, C, D, data_in, clk, reset);
	clock_stimulus : process
	begin
		wait for 10 ns;
		clk <= not clk;
	end process clock_stimulus;
	data_in_stimulus : process
	begin
		wait for 40 ns;
		data_in <= not data_in;
		wait for 150 ns;
	end process data_in_stimulus;
end test;


