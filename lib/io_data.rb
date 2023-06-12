class IOData
  attr_reader :loaded_data

  require 'json'

  def initialize
    @file_data = File.readlines("./english-no-swears.txt")
    @game_data = []
    @a_word
    @loaded_data
  end

  def get_a_word
    @file_data.each do |line|
      @game_data.push(line)
    end
    @a_word = @game_data.sample
  end

  def save_progress(the_word, the_score, prog_ary)
    save_file = File.exist?('./save.txt') ? File.open('./save.txt', 'w') : File.new('./save.txt', 'w')
    save_data = { :word => the_word, :score => the_score, :progess => prog_ary }
    save_file.puts JSON.generate(save_data)
    save_file.close
  end

  def load_data
    return (puts 'File not found') unless File.exist?('./save.txt')

    load_file = File.open('./save.txt', 'r')
    @loaded_data = JSON.parse(load_file.read, symbolize_names: true)
  end
end
