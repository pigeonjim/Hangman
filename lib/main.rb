require "./lib/game.rb"
require "./lib/mixins.rb"

include TextColours

a_game = Game.new
puts a_game.the_word
until a_game.score == a_game.the_word.length
  a_game.a_guess
  a_game.check_guess
  puts
end
puts "#{a_game.progress_ary.join(' ')} - #{a_game.score}/#{a_game.the_word.size}"
puts "Well done"
