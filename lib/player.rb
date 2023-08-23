class Player
  attr_accessor :name, :game_piece

  def initialize(game_piece)
    @name = nil
    @game_piece = game_piece
  end
end