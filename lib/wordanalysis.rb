class WordAnalysis

  def initialize(string)
    @string = string
    @words = string.split
    @letters = string.chars
  end

  def word_index
    indexed = []
    @words.each_with_index{ |item,index| indexed << "#{ index + 1 })#{item}" }
    indexed.join("\t")
  end

  def letter_index
    indexed = []
    counter = 1
    @letters.each{ |letter| if letter != ' '; indexed << "#{ counter })#{letter}"; counter += 1 ; end; }
    indexed.join("\t")
  end

  def symbol_index
    split = @string.scan(/[^0-9a-z ]/i)
    indexed = []
    split.each_with_index{ |item,index| indexed << "#{ index + 1 })#{item}" }
    indexed.join("\t")
  end

  def common_words
    counts = {}
    @words.each do |word|
      word.downcase!
      if counts.has_key?(word)
        counts[word] += 1
      else
        counts[word] = 0
      end
    end
    top = []
    counts.sort_by{ |k,v| v }.each{ |pair| top << pair[0] }
    top[-3..-1].reverse.join("\t")
  end

  def common_letters
    counts = {}
    @letters.each do |letter|
      letter.downcase!
      if counts.has_key?(letter)
        counts[letter] += 1
      else
        counts[letter] = 0
      end
    end
    top = []
    counts.sort_by{ |k,v| v }.each{ |pair| top << pair[0] }
    top[-3..-1].join("\t")
  end
end
