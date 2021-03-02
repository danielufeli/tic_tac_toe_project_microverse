#!/usr/bin/env ruby
require_relative '../lib/player'

def display_name
  puts 'Please Enter Player1 Name'
  player1_prompt = gets.chomp
  puts 'Please Enter Player 2 Name'
  player2_prompt = gets.chomp
  player1 = Player.new(player1_prompt, 'x')
  player2 = Player.new(player2_prompt, 'o')
  puts "Welcome #{player1.name} and #{player2.name} to tic tac toe"
end

display_name
