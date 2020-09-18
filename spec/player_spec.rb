# spec/player_spec.rb

require './lib/player'
require './lib/board'

describe Player do
  let(:player1) { Player.new('Yanick', 'X') }
  let(:player2) { Player.new('John', 'O') }
  let(:board) { Board.new }
  
  describe '#check_position?' do
    it 'return true if position is empty.' do
      expect(player1.check_position?(5, Board.new)).to eql(true)
    end
 
    it 'return false if position is taken' do
      player1.make_move(1, board)
      expect(player2.check_position?(1, board)).to eql(false)
    end
  end

  describe '#make_move' do
    it 'return true if there is a winner.' do
      player1.make_move(1, board)
      player2.make_move(3, board)
      player1.make_move(5, board)
      player2.make_move(6, board)
      expect(player1.make_move(9, board)).to eql(true)
    end
  end
end
