-- Designer: Pro.Tips Website
-- Design title: VHDL HelloWorld Program TestBench
-- Date: 11/22/2024

-- include the library 1st step
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity definition 2nd step
entity helloworld_tb is
end entity;

architecture behavior of helloworld_tb is
	
	component helloworld is
		port(	clk, rst : in std_logic;
				led_out : out std_logic);
	end component;

	signal clk : std_logic := '0';
	signal rst : std_logic := '1';
	signal led_out : std_logic;
	
begin

	-- clk equals 1mhz freq with this line
	clk <= not clk after 500ns;

	uut : helloworld port map(
		clk => clk,
	    rst => rst,
	    led_out => led_out
	);

	tb : process
	begin
		rst <= '1';
		wait for 1000 ns;
		rst <= '0';
		wait; -- waits forever
	end process;

end architecture;