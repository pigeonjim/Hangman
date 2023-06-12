class GetData

  def initialize
    @file_data = File.readlines("./english-no-swears.txt")
    @game_data = []
    @a_word
  end

  def get_a_word
    @file_data.each do |line|
      @game_data.push(line)
    end
    @a_word = @game_data.sample
  end

end
