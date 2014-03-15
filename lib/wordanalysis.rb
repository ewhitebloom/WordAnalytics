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

  def common_items(words_or_letters)
    counts = {}
    if words_or_letters.downcase == 'words'
      items = @words
    else
      items = @letters
    end
    items.each do |item|
      item.downcase!
      if counts.has_key?(item)
        counts[item] += 1
      else
        counts[item] = 0
      end
    end
    top = []
    counts.sort_by{ |k,v| v }.each{ |pair| top << pair[0] }
    if words_or_letters.downcase == 'words'
      top[-3..-1].reverse.join("\t")
    else
      top[-3..-1].join("\t")
    end
  end
end
