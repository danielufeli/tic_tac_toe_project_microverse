require './lib/board'
describe Board do
    board_class = Board.new
    describe "#print_board" do
        it "should print the expected board." do
            board = board_class.print_board
            view = "#{board_class.board_cell[0]}  |  #{board_class.board_cell[1]}  |  #{board_class.board_cell[2]}
     ++++++++++++++
      #{board_class.board_cell[3]}  |  #{board_class.board_cell[4]}  |  #{board_class.board_cell[5]}
     ++++++++++++++
      #{board_class.board_cell[6]}  |  #{board_class.board_cell[7]}  |  #{board_class.board_cell[8]}"
            expect(board).to  eql(view)
        end
        
    end
    describe "#update_board" do
        it "updates the board." do
            expect(board_class.update_board(4, 'x')).to eql('x')
        end
    end
end
