# spec/player_spec.rb

require './lib/player'
require './lib/board'

describe Player do
  describe '#check_position?' do
    it 'return true if position is empty.' do
      player = Player.new('Yanick', 'x')
      expect(player.check_position?(5, Board.new)).to eql(true)
    end
  end
end
