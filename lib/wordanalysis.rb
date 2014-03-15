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
    counter = 1
    split.each{ |letter| if letter != ' '; indexed << "#{ counter }:#{letter}"; counter += 1 ; end; }
    indexed.join("\t")
  end

  def symbol_index
    split = @string.scan(/[^0-9a-z ]/i)
    indexed = []
    split.each_with_index{ |item,index| indexed << "#{ index + 1 }:#{item}" }
    indexed.join("\t")
  end

  def common_words
  end

  def common_letters
  end
end


print WordAnalysis.new("There's 'jim'; age: 20.").symbol_index
