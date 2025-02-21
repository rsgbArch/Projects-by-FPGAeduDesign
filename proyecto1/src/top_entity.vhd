library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity HCSR04 is
  generic
    (n : integer := 20);
  port
  (
    clk          : in std_logic;
    echo         : in std_logic;
    Trigger      : buffer std_logic;
    display_out  : out std_logic_vector (6 downto 0);
    display_out2 : out std_logic_vector (6 downto 0);
    transistor   : out std_logic_vector (3 downto 0)
  );
end HCSR04;

architecture Behavioral of HCSR04 is

  component TriggerGen
    port
    (
      clk     : in std_logic;
      trigger : out std_logic

    );
  end component;

  component counter
    port
    (
      clk    : in std_logic;
      reset  : in std_logic;
      enable : in std_logic;
      q      : out std_logic_vector(19 downto 0)
    );
  end component;

  component distance_calculation
    port
    (
      echo_count : in std_logic_vector(19 downto 0);
      distance   : out std_logic_vector(8 downto 0)
    );
  end component;

  component display_decoder
    port
    (
      distance_in1 : in std_logic_vector(8 downto 0);
      display_sal  : out std_logic_vector(6 downto 0);
      display_sal2 : out std_logic_vector (6 downto 0)
      --transistor : out STD_LOGIC_VECTOR (3 downto 0)

    );
  end component;

  signal Trigger_out   : std_logic;
  signal echo_counter1 : std_logic_vector (19 downto 0);
  signal echo_count    : std_logic_vector (19 downto 0);
  signal distance_bits : std_logic_vector(8 downto 0);
begin
  u1 : counter port map
  (
    clk,
    Trigger_out,
    echo,
    echo_counter1
  );
 
  process (echo) begin
    if falling_edge(echo) then
      echo_count <= echo_counter1;
    end if;

  end process;

  u2 : TriggerGen port
  map(
    clk,
    Trigger_out
  );

  u3 : distance_calculation port
  map(
    echo_count,
    distance_bits
  );

  u4 : display_decoder port
  map(
    distance_bits,
    display_out,
    display_out2
  );

  Trigger <= Trigger_out;
end Behavioral;
