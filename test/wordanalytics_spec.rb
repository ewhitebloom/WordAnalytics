require 'rspec'
require_relative '../lib/wordanalysis'

describe WordAnalysis do
#   let(:pi) { 3.14159265359 }
#   let(:tolerance) { 0.01 }
#
  describe '#word_index' do
    let(:wordanalysis) { WordAnalysis.new("This is a sort of really long string.")}
    it 'calculates the index of each word' do
      expect(wordanalysis.word_index).to eql("1:This\t2:is\t3:a\t4:sort\t5:of\t6:really\t7:long\t8:string.")
    end
  end

  describe '#letter_index' do
    let(:wordanalysis) { WordAnalysis.new("A String")}
    it 'calculates the index of each letter' do
      expect(wordanalysis.letter_index).to eql("1:A\t2:S\t3:t\t4:r\t5:i\t6:n\t7:g")
    end
  end

  describe '#symbol_index' do
    let(:wordanalysis) { WordAnalysis.new("There's 'jim'; age: 20.")}
    it 'calculates the index of each symbol' do
      expect(wordanalysis.symbol_index).to eql("1:'\t2:'\t3:'\t4:;\t5::\t6:.")
    end
  end


  describe '#common_words' do
    it 'calculates the 5 most common words' do
      # expect(circle.diameter).to eql(14)
    end
  end

  describe '#common_letters' do
    it 'calculates the 5 most common letters' do
      # expect(circle.diameter).to eql(14)
    end
  end
#
#   describe '#circumference' do
#   it 'calculates the circumference' do
#     expect(circle.circumference).to be_within(tolerance).of(43.98)
#   end
# end

end
