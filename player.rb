# frozen_string_literal: true

require './board'

class Player
  attr_accessor :codebreaker

  def initialize
    @codebreaker = false
  end
end

class Human_player < Player
  def initialize
  end
end

class Computer_player < Player

  def initialize
  end

  # attr_accessor :board, :available_combinations

  # def initialize(board)
  #   @board = board
  #   @available_combinations = (1111..6666).to_a
  # end

  # def create_guess(previousGuess)
  #   clues = board.get_clues(previousGuess)
  #   adjusted_set_of_combinations = []
  #   available_combinations.each do |combination|
  #     # p clues[0].to_s + " " + board.get_clues(combination)[0].to_s
  #     adjusted_set_of_combinations.push(combination) if clues[0] + clues[1] <= board.get_clues(combination)[0] + board.get_clues(combination)[1]
  #   end
  #   p adjusted_set_of_combinations
  #   adjusted_set_of_combinations.sample
  # end
end
