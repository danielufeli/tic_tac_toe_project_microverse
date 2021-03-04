require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :board, :player1, :player2, :winner

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @winner = nil
  end
end
