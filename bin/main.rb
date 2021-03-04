#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/player'

module Maingame
  @game = Game.new
  WINNING_COMBO = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze

  def self.start_game
    create_players
    play_game
  end

  def self.create_players
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
    @game.player1 = Player.new(player_one, icon1)
    @game.player2 = Player.new(player_two, icon2)
    puts @game.player1.name
    puts @game.player2.name
  end

  def self.play_game
    played_count = 1
    until game_ended(played_count)
      @game.board.print_board
      if played_count.odd?
        move(@game.player1)
      else
        move(@game.player2)
      end

      played_count += 1
    end
    @game.board.print_board

    if @game.winner
      puts "Game over: #{@game.winner} wins!!!"
    else
      puts "It's a draw!"
    end
  end

  def self.valid_move(index)
    index.between?(1, 9) && @game.board.board_cell[index - 1].is_a?(Numeric)
  end

  def self.move(player)
    puts "#{player.name}'s turn"
    index = gets.chomp
    until valid_move(index.to_i)
      puts 'enter a valid value, try again'
      index = gets.chomp
    end
    @game.board.update_board(index, player.icon)
    player.square.push(index.to_i)
  end

  def self.game_ended(turn_count)
    return unless turn_count >= 5

    WINNING_COMBO.each do |arr_val|
      if @game.player1.square.intersection(arr_val) == arr_val
        @game.winner = @game.player1.name
        return true
      elsif @game.player2.square.intersection(arr_val) == arr_val
        @game.winner = @game.player2.name
        return true
      elsif @game.player1.square.intersection(arr_val) == arr_val && @game.board.board_cell.all?(String)
        @game.winner = @game.player1.name
        return true
      elsif @game.player2.square.intersection(arr_val) == arr_val && @game.board.board_cell.all?(String)
        @game.winner = @game.player2.name
        return true
      end
    end
    return true if @game.board.board_cell.all?(String)

    false
  end
end

Maingame.start_game
