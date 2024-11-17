
-- include the library 1st step
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity definition 2nd step
entity helloworld is
	port(	clk, rst : in std_logic;
			led_out : out std_logic);
end entity;

-- architecture definition
architecture behavior of helloworld is
	
	signal counter : unsigned(19 downto 0);
	signal clk_enable_1sec : std_logic;
	signal led_status : std_logic;
begin

	-- counter that goes from 0 to 999999
	process(clk, rst)
	begin
		if rst = '1' then
			counter <= (others => '0');
		elsif rising_edge(clk) then
			if counter = 999999 then
				counter <= (others => '0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;

	-- every 500000th pulse, clock enable 1sec will setting for 1 cycle
	clk_enable_1sec <= '1' when counter = 500000 else '0';
	
	-- toggle the led_out every second
	process(clk, rst)
	begin
		if rst = '1' then
			led_status <= '0';
		elsif rising_edge(clk) then
			if (clk_enable_1sec = '1') then
				led_status <= not led_status;
			end if;
		end if;
	end process;
	
	led_out <= led_status;

end architecture;