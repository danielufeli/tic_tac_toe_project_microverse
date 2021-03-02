class Board
    WINNING_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
    BOARD = Array.new(9, '')


    def board
      puts "  #{BOARD[0]}  | #{BOARD[1]}  | #{BOARD[2]}"
      puts '______________'
      puts "  #{BOARD[3]}  | #{BOARD[4]}  | #{BOARD[5]}"
      puts '______________'
      puts "  #{BOARD[6]}  | #{BOARD[7]}  | #{BOARD[8]}"
    end
    
    
    def update_board
      BOARD.length.times do
      puts 'enter the position you want to insert your icon'
      value = gets.chomp.to_i
      BOARD[value - 1] = 'X'
      puts board
      end
    end
    
end

