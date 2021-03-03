#!/usr/bin/env ruby
require_relative 'player'
require_relative 'board'

class Game
    WINNING_COMBO = [
        [0, 3, 7], [1, 4, 7], [2, 5, 8], [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]
    ]

    def initialize
      @board = Board.new
      @player1 = nil
      @player2 = nil
      @winner = nil
    end

  def start_game
    puts 'Welcome to tic tac toe Game!'
    create_players
    play_game
  end

  # up next the funtionality and the game creation.
   
  
    def valid_move(index)
        index.between?(1, 9) && @board.board_cell[index.to_i - 1].is_a?(Numeric)
    end
    
    def game_ended?(turn_count)
      if turn_count >= 5
        WINNING_COMBO.each do |arr_val|
          if @player1.square.intersection(arr_val) == arr_val
            @winner = @player1.name
            return true
          elsif @player2.square.intersection(arr_val) == arr_val
          @winner = @player2.name
          return true
          end
        end
      end
      return false if @board.board_cell.all?(String)
      false
    end
    
  def move(player)
      puts "#{player.name}'s turn"
      index = gets.chomp.to_i
      while valid_move(index.to_i)
          puts 'enter a valid value'
          index = gets.chomp
      end
      @board.update_board(index.to_i, player.icon)
      player.square.push(index - 1)
  end
end

