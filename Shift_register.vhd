library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity Shift_register is
    Port ( A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           data_in : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end Shift_register;

architecture Behavioral of Shift_register is
signal A_reg, B_reg : std_logic:= '0';
signal C_reg, D_reg : std_logic:= '0';

begin
    A <= A_reg;
    B <= B_reg;
    C <= C_reg;
    D <= D_reg;
    reg_process: process(clk)
    begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                A_reg <= '0';
                B_reg <= '0';
                C_reg <= '0';
                D_reg <= '0';
            else
                A_reg <= data_in;
                B_reg <= A_reg;
                C_reg <= B_reg;
                D_reg <= C_reg;
            end if;
         end if;
     end process reg_process;
end Behavioral;
