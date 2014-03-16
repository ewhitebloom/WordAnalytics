require 'rspec'
require_relative '../lib/wordanalysis'

describe WordAnalysis do

  describe '#word_count' do
    let(:wordanalysis) { WordAnalysis.new("lorem ipsum hi hi bye bye hi")}
    it 'calculates the count of each word' do
      expect(wordanalysis.count('word')).to eql([["hi", 3], ["bye", 2], ["ipsum", 1], ["lorem", 1]])
    end
  end

  describe '#letter_count' do
    let(:wordanalysis) { WordAnalysis.new("gggg hhhh k i oooooo jjjjjjjj")}
    it 'calculates the count of each letter' do
      expect(wordanalysis.count('letter')).to eql([["j", 8], ["o", 6], ["h", 4], ["g", 4], ["k", 1], ["i", 1]])
    end
  end

  describe '#symbol_count' do
    let(:wordanalysis) { WordAnalysis.new("There's 'jim'; age: 20.")}
    it 'calculates the count of each symbol' do
      expect(wordanalysis.count('symbol')).to eql([["'", 3], [":", 1], [";", 1], [".", 1]])
    end
  end


  describe '#common_words' do
    let(:wordanalysis) { WordAnalysis.new("dog cat lizard gerbil dog cat cat dog parrot parrot hamster")}
    it 'calculates the 3 most common words' do
      expect(wordanalysis.common_items(wordanalysis.count('word'))).to eql("dog\tcat\tparrot")
    end
  end

  describe '#once' do
    let(:wordanalysis) { WordAnalysis.new("dog cat lizard gerbil dog cat cat dog parrot parrot hamster")}
    it 'calculates number of words used only once' do
      expect(wordanalysis.once(wordanalysis.count('word'))).to eql(3)
    end
  end

  describe '#common_letters' do
    let(:wordanalysis) { WordAnalysis.new("n mmmmmmmm kkkkkkkkkk r j oooooo ")}
    it 'calculates the 3 most common letters' do
      expect(wordanalysis.common_items(wordanalysis.count('Letter'))).to eql("k\tm\to")
    end
  end

end
