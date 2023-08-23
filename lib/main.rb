require_relative 'game'

def start_game
  loop do
    game = Game.new
    game.play_game
    break unless play_again?
  end
end

def play_again?
  loop do
    puts 'Do you want to play again?'
    puts "\e[32m[1]\e[0m Play another round."
    puts "\e[31m[2]\e[0m Exit."
    input = gets.chomp
    return true if input == '1'
    return false if input == '2'
  end
end

start_game
