require './lib/game'

a_game = Game.new
puts a_game.the_word
until a_game.score == a_game.the_word.length - 2
  a_game.a_guess
  a_game.check_guess
  puts "\n"
end
a_game.game_save
