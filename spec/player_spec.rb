# spec/player_spec.rb

require './lib/player'
require './lib/board'

describe Player do
  describe '#check_position?' do
    it 'return true if position is empty.' do
      player = Player.new('Yanick', 'x')
      expect(player.check_position?(5, Board.new)).to eql(true)
    end
 
    it 'return false if position is taken' do
      player = Player.new('John', 'O')
      board = Board.new
      player.make_move(1, board)
      expect(player.check_position?(1, board)).to eql(false)
    end
  end
end
