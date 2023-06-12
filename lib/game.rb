class Game
  attr_reader :the_word, :score, :progress_ary, :the_letter

  require './lib/io_data'
  require './lib/mixins'
  include TextColours

  def initialize
    @game_data = IOData.new
    @score = 0
    @the_word = @game_data.get_a_word.strip
    @progress_ary = Array.new(@the_word.size){"\u2753"}
    @the_letter
  end

  def a_guess
    @the_letter = ''
    until check_input(the_letter)
      puts "#{@progress_ary.join(' ')} - #{@score}/#{@the_word.size}"
      puts 'Please input one letter to guess'
      @the_letter = gets.chomp.downcase.strip
      puts "\e[1;31m\nIncorrect entry. Please try again\n\e[0m" unless check_input(the_letter)
    end
  end

  def check_input(a_letter)
    return false unless a_letter.size == 1

    return false if a_letter.scan(/[a-z]/).empty?

    return true
  end

  def check_guess
    puts "Letter not found\n" unless @the_word.include?(@the_letter)
    while @the_word.include?(@the_letter)
      idx = @the_word.index(@the_letter)
      @progress_ary[idx] = @the_letter
      @the_word.sub!(@the_letter, ' ')
      @score += 1
    end
  end

  def game_save
    @game_data.save_progress(@the_word, @score, @progress_ary)
  end
end
