# spec/board_spec.rb

require './lib/player'
require './lib/board'

describe Board do
    describe '#current_board' do
        it 'returns an empty board' do
            board = Board.new
            expect(board.current_board).to eql("\n   |   |   \n----------- \n   |   |   \n----------- \n   |   |   \n")
        end
    end
end