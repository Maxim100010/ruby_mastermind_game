# frozen_string_literal: true

class Board
  attr_accessor :master_code, :master_colors, :hash_of_pegs

  def initialize
    @master_code = []
    @master_colors = []
    @hash_of_pegs = Hash['red' => 1, 'blue' => 2, 'green' => 3, 'orange' => 4, 'cyan' => 5, 'black' => 6]
  end

  def create_combination(combination)
    combination.to_s.split('').each do |number|
      master_code.push(number)
      master_colors.push(hash_of_pegs.key(number.to_i))
    end
  end

  def play_guess(guess)
    count_matching_positions = 0
    count_present_numbers = 0
    guess.to_s.split('').each_with_index do |number, index|
      count_present_numbers += 1 if master_code.include?(number)
      count_matching_positions += 1 if (master_code.include? number) && master_code.each_index.select do |i|
                                         master_code[i] == number
                                       end.include?(index)
    end
    [count_present_numbers - count_matching_positions, count_matching_positions]
  end
end

b = Board.new
b.create_combination(6363)
pp b.master_code
pp b.master_colors

pp b.play_guess(6663)
