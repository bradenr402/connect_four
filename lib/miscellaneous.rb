require 'io/console'

module Miscellaneous
  def yellow_circle
    "\e[33m\u25cf\e[0m"
  end

  def red_circle
    "\e[31m\u25cf\e[0m"
  end

  def empty_circle
    "\u25cb"
  end

  def get_char
    input = STDIN.getch
    control_c_code = "\u0003"
    exit(1) if input == control_c_code
    input
  end
end
