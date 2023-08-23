require_relative 'board'
require_relative 'player'
require_relative 'miscellaneous'

class Game
  include Miscellaneous

  def initialize
    @board = Board.new
    @player1 = Player.new(yellow_circle)
    @player2 = Player.new(red_circle)
    @turn_number = 0
  end

  def play_game
    introduction
    set_player_names
    loop do
      current_player = player_turn
      @board.display
      column = player_input(current_player)
      @board.update(@board.available_row(column), column, current_player.game_piece)
      break if game_over?(current_player) || draw?
    end
    @board.display
  end

  def player_input(player)
    puts "#{player.game_piece} #{player.name}'s turn."
    loop do
      print 'Enter a column number: '
      column = gets.chomp.to_i - 1
      return column if valid_input?(column)
      puts "Invalid input! Try again!\n\n"
    end
  end

  def valid_input?(input)
    input.between?(0, 6) && !@board.full_column?(input)
  end

  def player_turn
    @turn_number += 1
    @turn_number.odd? ? @player1 : @player2
  end

  def game_over?(player)
    6.times do |row|
      7.times do |column|
        if @board.check_row(row, column, player.game_piece)
          puts "\e[35m#{player.name}\e[0m wins!"
          return true
        end
      end
    end
    false
  end

  def draw?
    if @turn_number == 42
      puts 'Draw!'
      return true
    end
    false
  end

  private

  def introduction
    puts <<-TEXT
  Welcome to Connect Four!
  This classic game is a test of your strategic skills,
  and you'll have to outsmart your opponent in order to win.

  To play, each player takes turns placing their colored discs
  in the board. The first player to get four of their discs in a row,
  either horizontally, vertically, or diagonally, wins the game.

  To place a piece, enter a column number (1 to 7).

  Are you ready to put your strategic skills to the test?
  Grab a friend and find out who the true Connect Four master is!
  May the best player win!

  Press any key to continue:
    TEXT
    get_char
  end

  def ask_player_name(number)
    print "Player #{number}, enter your name: "
    gets.chomp.capitalize
  end

  def set_player_names
    @player1.name = ask_player_name(1)
    @player2.name = ask_player_name(2)
  end
end
