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

    describe '#move' do
      it 'returns if there is a winner after the fourth move' do
        board = Board.new
        board.move(0, 0, 'X')
        board.move(0, 2, 'O')
        board.move(1, 1, 'X')
        board.move(1, 2, 'O')
        expect(board.move(2, 2, 'X')).to eql(board.winner)
      end
    end

    describe '#check_winner' do
        it 'checks if there is a winner in row' do
        board = Board.new
        board.move(0, 0, 'X')
        board.move(0, 1, 'X')
        expect(board.check_winner(0, 2, 'X')).not_to eql(true)
        end

        it 'checks if there is a winner in column' do
          board = Board.new
          board.move(0, 0, 'X')
          board.move(1, 0, 'X')
          expect(board.check_winner(2, 0, 'X')).not_to eql(true)
        end

        it 'checks if there is a winner in diagonal from left to right' do
            board = Board.new
            board.move(0, 0, 'X')
            board.move(1, 1, 'X')
            expect(board.check_winner(2, 2, 'X')).not_to eql(true)
          end

          it 'checks if there is a winner in diagonal from right to left' do
            board = Board.new
            board.move(0, 2, 'X')
            board.move(1, 1, 'X')
            expect(board.check_winner(2, 0, 'X')).not_to eql(true)
          end

          it 'checks if there is a draw' do
            board = Board.new
            board.move(0, 0, 'X')
            board.move(0, 1, 'O')
            board.move(0, 2, 'X')
            board.move(1, 0, 'O')
            board.move(1, 1, 'X')
            board.move(1, 2, 'O')
            board.move(2, 0, 'X')
            board.move(2, 1, 'O')
            expect(board.check_winner(2, 2, 'X')).not_to eql(true)
          end
    end

    describe '#empty_position?' do
      it 'returns true if position is empty'
        board = Board.new
        board.move(0, 0, '')
        expect(board.empty_position?(0, 0)).to eql(true)
      end

      it 'returns false if position is taken'
        board = Board.new
        board.move(1, 1, 'X')
        expect(board.empty_position?(1, 1)).to eql(false)
      end
    end
end

