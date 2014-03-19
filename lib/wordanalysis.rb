class WordAnalysis

  def initialize(string)
    @string = string
  end

  def word_count
    items = @string.split
    count(items)
  end

  def letter_count
    items = @string.scan(/[a-z]/i)
    count(items)
  end

  def symbol_count
    items = @string.scan(/[^0-9a-z ]/i)
    count(items)
  end

  def count(items)
    counts = {}

    items.each do |item|
      item.downcase!

      if counts.has_key?(item)
        counts[item] += 1
      else
        counts[item] = 1
      end
    end

    counts.sort_by{ |k,v| v }.reverse
  end

  def once(counts)
    counter = 0

    counts.each do |pair|
      counter += 1 if pair[1] == 1
    end

    counter
  end

  def common_items(counts)
    top = []
    counts[0..2].each{ |pair| top << pair[0] }
    top.join("\t")
  end
end
