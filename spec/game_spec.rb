require './lib/game'
require './lib/player'
describe Game do
  game_class = Game.new
  game_class.player1 = Player.new('promise', 'o')
  game_class.player2 = Player.new('alicia', 'x')

  describe '#valid_move' do
    it 'should return false if a number is not between 1 and 9.' do
      # game_class.board.board_cell = ['x', 'o', 'x', 'o', 'x', 'o', 'x', 'o', 'x']
      expect(game_class.valid_move(8)).to be true
    end

    it 'should return true if a move is valid.' do
      expect(game_class.valid_move(3)).to be true
    end
  end
  describe '#game_ended' do
    it 'should return true if the play count is 9. (a draw)' do
    #   game_class.board.board_cell = %w[x o x o x o x o x]
      game_class.board.board_cell = ['x', 'o', 'x', 'o', 'x', 'o', 'x', 'o', 'x']
      expect(game_class.game_ended(9)).to be true
    end
    # other rspec methods go here on the game class.
  end
end