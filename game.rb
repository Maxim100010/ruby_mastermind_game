# frozen_string_literal: true

class Game
  def initialize; end

  def print_instructions
    puts 'MASTERMIND'
    puts "The point of this game is to guess a code. After each guess, the player gets a clue whether there are matching numbers and whether they are in the correct position or not\n
    You can get up to 3 clues\n
    Clue 'X' means that there is a number present which is part of the final code\n
    Clue 'O' means that there is a number present which is part of the final code and it is also in the correct position"
    puts
    puts 'You can either MAKE or BREAK a code, Type (1) if you want to be the CODEBREAKER or type (2) if you want to be the CODEMAKER'
  end
end
