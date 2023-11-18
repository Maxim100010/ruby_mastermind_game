# frozen_string_literal: true

require './player'
require './board'
require 'colorize'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def print_instructions
    puts 'MASTERMIND'
    puts "The point of this game is to guess a code. After each guess, the player gets a clue whether there are matching numbers and whether they are in the correct position or not\n
    You can get up to 3 clues\n
    Clue 'X' means that there is a number present which is part of the final code\n
    Clue 'O' means that there is a number present which is part of the final code and it is also in the correct position"
    puts
    puts 'You can either MAKE or BREAK a code, Type (1) if you want to be the CODEBREAKER or type (2) if you want to be the CODEMAKER'
  end

  def computer_code_maker
    combination = []
    combination.push(rand(1..6)) until combination.size == 4
    pegs = board.hash_of_pegs
    board.create_combination(combination.join)
    puts "\nThe computer has created a code for you to guess. The code consits of 4 numbers ranging from 1 to 6\n\n"
    12.times do
      puts 'please input your guess (4 numbers 1-6):'
      guess = ''
      guess = gets.chomp until guess.length == 4 && guess !~ /\D/ && guess.split('').all? { |number| number.to_i.between?(1,6) }
      puts "You guessed the code correctly!!! (#{combination.join})".colorize(:background => :green); return if guess == combination.join

      guess_arr = guess.split('')
      puts "\nNot correct\n\n"
      puts " #{" #{guess_arr[0]} ".colorize(mode: :bold,
                                            background: pegs.key(guess_arr[0].to_i))} #{" #{guess_arr[1]} ".colorize(mode: :bold,
                                                                                                                     background: pegs.key(guess_arr[1].to_i))} #{" #{guess_arr[2]} ".colorize(mode: :bold,
                                                                                                                                                                                              background: pegs.key(guess_arr[2].to_i))} #{" #{guess_arr[3]} ".colorize(mode: :bold,
                                                                                                                                                                                                                                                                       background: pegs.key(guess_arr[3].to_i))}\n\n"
      clues = board.get_clues(guess.to_i)
      puts "Clues: #{'X' * clues[0]}#{'O' * clues[1]}\n\n"
    end
    puts "You lose, the code was: #{combination.join}".colorize(:background => :red)
  end

  def start_game
    human_player = Human_player.new
    computer_player = Computer_player.new
    print_instructions
    while (choice = gets.chomp)
      case choice
      when '1'
        human_player.codebreaker = true
        break
      when '2'
        computer_player.codebreaker = true
        break
      else
        puts 'Please select either 1 or 2'
      end
    end
    result = computer_code_maker if human_player.codebreaker == true
  end
end
g = Game.new
g.start_game
