require 'rspec'
require_relative 'string_calculator'

describe StringCalculator do
  let(:calculator) { described_class.new }

  context '#add' do
    it 'returns 0 when empty number is sent' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns 0 when empty number is sent' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the integer when just an integer is sent' do
      expect(calculator.add('2')).to eq(2)
    end

    it 'returns the addition of integer when we send params with comma seperated' do
      expect(calculator.add('2,3')).to eq(5)
    end

    it 'returns the addition of integer when we send params with comma seperated' do
      expect(calculator.add('2,3,5')).to eq(10)
    end

    it 'returns the addition of integer when we send params with comma seperated' do
      expect(calculator.add('2,3,5')).to eq(10)
    end

    it "returns the addition of integer when we send params with \n seperated" do
      expect(calculator.add("2,\n3,5")).to eq(10)
    end

    it "returns the addition of integer when we send params with \n and different seperator" do
      expect(calculator.add("//;3;\n5;2")).to eq(10)
    end

    it "returns the addition of integer when we send params with \n and different seperator" do
      expect { calculator.add('-1,-2') }.to raise_error('Negative Numbers are -1,-2')
    end
  end
end
