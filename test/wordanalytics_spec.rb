require 'rspec'
require_relative '../lib/wordanalysis'

describe WordAnalysis do

  describe '#word_index' do
    let(:wordanalysis) { WordAnalysis.new("This is a sort of really long string.")}
    it 'calculates the index of each word' do
      expect(wordanalysis.word_index).to eql("1)This\t2)is\t3)a\t4)sort\t5)of\t6)really\t7)long\t8)string.")
    end
  end

  describe '#letter_index' do
    let(:wordanalysis) { WordAnalysis.new("A String")}
    it 'calculates the index of each letter' do
      expect(wordanalysis.letter_index).to eql("1)A\t2)S\t3)t\t4)r\t5)i\t6)n\t7)g")
    end
  end

  describe '#symbol_index' do
    let(:wordanalysis) { WordAnalysis.new("There's 'jim'; age: 20.")}
    it 'calculates the index of each symbol' do
      expect(wordanalysis.symbol_index).to eql("1)'\t2)'\t3)'\t4);\t5):\t6).")
    end
  end


  describe '#common_words' do
    let(:wordanalysis) { WordAnalysis.new("dog cat lizard gerbil dog cat cat dog parrot parrot hamster")}
    it 'calculates the 3 most common words' do
      expect(wordanalysis.common_items('Words')).to eql("dog\tcat\tparrot")
    end
  end

  describe '#once' do
    let(:wordanalysis) { WordAnalysis.new("dog cat lizard gerbil dog cat cat dog parrot parrot hamster")}
    it 'calculates number of words used only once' do
      expect(wordanalysis.once).to eql(3)
    end
  end

  describe '#common_letters' do
    let(:wordanalysis) { WordAnalysis.new("jjjjj llllll oooooo ddd aa")}
    it 'calculates the 3 most common letters' do
      expect(wordanalysis.common_items('Letters')).to eql("j\tl\to")
    end
  end

end
