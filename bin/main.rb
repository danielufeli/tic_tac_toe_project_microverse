#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/player'

@game = Game.new

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

played_count = 1
until @game.game_ended(played_count)
  @game.board.print_board
  if played_count.odd?
    @game.move(@game.player1)
  else
    @game.move(@game.player2)
  end

  played_count += 1
end
@game.board.print_board

if @game.winner
  puts "Game over: #{@game.winner} wins!!!"
else
  puts "It's a draw!"
end
