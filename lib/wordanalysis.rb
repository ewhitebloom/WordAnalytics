class WordAnalysis

  def initialize(string)
    @string = string
    @words = string.split
    @letters = string.scan(/[a-z]/i)
    @symbols = string.scan(/[^0-9a-z ]/i)
  end

  def count(word_letter_or_symbol)
    if word_letter_or_symbol.downcase == 'word'; items = @words; elsif word_letter_or_symbol.downcase == 'letter'; items = @letters; elsif word_letter_or_symbol.downcase == 'symbol'; items = @symbols; else; puts 'Please ask for word, letter or symbol count.'; exit; end;
    counts = {}
    items.each { |item| item.downcase!; if counts.has_key?(item); counts[item] += 1; else counts[item] = 1; end; }
    counts.sort_by{ |k,v| v }.reverse
  end

  def once(counts)
    counter = 0
    counts.each{ |pair| if pair[1] == 1; counter += 1; end; }
    counter
  end

  def common_items(counts)
    top = []
    counts[0..2].each{ |pair| top << pair[0]; }
    top.join("\t")
  end
end
