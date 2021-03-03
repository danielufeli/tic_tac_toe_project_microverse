#!/usr/bin/env ruby
require_relative 'player'
require_relative 'board'

class Game
    WINNING_COMBO = [
        [1, 2, 3], [4, 5, 6], [7 ,8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
    ].freeze

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

  def create_players
      puts 'player one enter your name'
      player_one = gets.chomp
      puts 'player two enter your name too'
      player_two = gets.chomp
      while player_two == player_one
        puts 'ooops!! you both can\'t have the same name.'
        player_two = gets.chomp
      end
      puts 'player one enter your icon.'
      icon1 = gets.chomp
      puts 'player two enter your icon.'
      icon2 = gets.chomp
      @player1 = Player.new(player_one, icon1)
      @player2 = Player.new(player_two, icon2)
      puts @player1.name
      puts @player2.name
  end

   def play_game
    played_count = 1
    until game_ended(played_count)
      @board.print_board
      if played_count % 2 != 0
        move(@player1)
      else
        move(@player2)
      end
      
      played_count += 1
    end
    @board.print_board
     
    if @winner
      puts "Game over: #{@winner} wins!!!"
    else
      puts "It's a draw!"
    end
    
  end
  
  def move(player)
      puts "#{player.name}'s turn"
      index = gets.chomp
      until valid_move(index.to_i)
          puts 'enter a valid value, try again'
          index = gets.chomp
      end
      @board.update_board(index, player.icon)
      player.square.push(index.to_i)
  end

    def valid_move(index)
        index.between?(1, 9) && @board.board_cell[index - 1].is_a?(Numeric)
    end
    
    def game_ended(turn_count)
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
      return true if @board.board_cell.all?(String) 
      false
    end
    
  
end

