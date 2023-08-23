require_relative 'miscellaneous'

class Board
  include Miscellaneous

  attr_reader :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_circle } }
  end

  def display
    @grid.each do |row|
      print "\n       " + row.join(' ')
    end
    print "\n       " + (1..7).to_a.join(' ') + "\n\n"
  end

  def update(row, column, game_piece)
    @grid[row][column] = game_piece
  end

  def full_column?(input)
    @grid[0][input] != empty_circle
  end

  def available_row(column)
    row = 0
    loop do
      return row if row == 5 || @grid[row + 1][column] != empty_circle
      row += 1
    end
  end

  def check_row(row, column, game_piece)
    check_horizontal(row, column, game_piece) || check_vertical(row, column, game_piece) || check_diagonals(row, column, game_piece)
  end

  def check_horizontal(row, column, game_piece)
    return if column > 3
     @grid[row][column] == game_piece && @grid[row][column + 1] == game_piece && @grid[row][column + 2] == game_piece && @grid[row][column + 3] == game_piece
  end

  def check_vertical(row, column, game_piece)
    return if row > 2
     @grid[row][column] == game_piece && @grid[row + 1][column] == game_piece && @grid[row + 2][column] == game_piece && @grid[row + 3][column] == game_piece
  end

  def check_diagonals(row, column, game_piece)
    return unless row < 3
    check_left_diagonal(row, column, game_piece) || check_right_diagonal(row, column, game_piece)
  end

  def check_left_diagonal(row, column, game_piece)
    return if column > 3
    @grid[row][column] == game_piece && @grid[row + 1][column + 1] == game_piece && @grid[row + 2][column + 2] == game_piece && @grid[row + 3][column + 3] == game_piece
  end

  def check_right_diagonal(row, column, game_piece)
    return if column < 3
    @grid[row][column] == game_piece && @grid[row + 1][column - 1] == game_piece && @grid[row + 2][column - 2] == game_piece && @grid[row + 3][column - 3] == game_piece
  end
end
