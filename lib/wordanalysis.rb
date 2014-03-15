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

  def once
    counts = {}
    @words.each {|word| word.downcase!; if counts.has_key?(word); counts[word] += 1; else counts[word] = 1; end;}
    counter = 0
    counts.sort_by{ |k,v| v }.each{ |pair| if pair[1] == 1; counter += 1; end; }
    counter
  end

  def common_items(words_or_letters)
    counts = {}
    if words_or_letters.downcase == 'words'; items = @words; elsif words_or_letters.downcase == 'letters'; items = @letters; else "Please ask for 'words' or 'letters'."; exit; end;
    items.each {|item| item.downcase!; if counts.has_key?(item); counts[item] += 1; else counts[item] = 1; end;}
    top = []
    counts.sort_by{ |k,v| v }.each{ |pair| unless pair[0] == ' '; top << pair[0]; end; }
    if words_or_letters.downcase == 'words'; top[-3..-1].reverse.join("\t"); else; top[-3..-1].join("\t"); end;
  end
end
