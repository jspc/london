require 'spec_helper'

describe London::Formatter do
  let(:formatter) {London::Formatter.new}
  let(:output) { formatter.get_output }

  it 'should instantiate correctly' do
    expect(formatter).to respond_to :get_output
    expect(formatter).to respond_to :to_celsius
  end

  it 'should give me sensible data' do
    expect(output).to include 'Weather:'
    expect(output).to include 'Wind:'
    expect(output).to include 'Sunrise:'
    expect(output).to include 'Sunset:'
    expect(output).to include 'High:'
    expect(output).to include 'Low:'
  end

  it 'should handle UTF-8 gracefully' do
    expect(output).to include "\u00B0".encode
  end

  context 'when calling #to_celsius' do
    it 'should return the temperature in celsius' do
      degc = ["\u00B0".encode, "c"].join
      {100 => 37, 75 => 23, 50 => 10, 25 => -4}.each do |f,c|
        c_formatted = [c, degc].join
        expect(formatter.to_celsius(f)).to eql(c_formatted)
      end
    end
  end
end
