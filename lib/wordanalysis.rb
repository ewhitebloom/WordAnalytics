class WordAnalysis

  def initialize(string)
    @string = string
  end

  def word_index
    split = @string.split
    indexed = []
    split.each_with_index{ |item,index| indexed << "#{ index + 1 }:#{item}" }
    indexed.join("\t")
  end

  def letter_index
    split = @string.chars
    indexed = []
    counter = 0
    split.each_with_index{ |item,index| if item != ' '; indexed << "#{ index + 1 }:#{item}"; end; }
    indexed.join("\t")
  end

  def symbol_index
  end

  def common_words
  end

  def common_letters
  end
end


print WordAnalysis.new("It's a string with some stuff in it").word_index
