class GamesController < ApplicationController
  def new
    @letters = 'a'.upto('z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(' ')
    word_array = @word.split('')
    @word_in_grid = word_in_grid?(word_array, @letters)

  end

  def word_in_grid?(word_array, letters)
    answer = true
    word_array.each do |letter|
      if letters.include?(letter)
        ind = letters.index(letter)
        letters.delete_at(ind)
      else
        answer = false
      end
    end
    return answer
  end

end
