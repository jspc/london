require 'spec_helper'
require 'time'

describe London::Weather do
  let(:weather) {London::Weather.new}
  let(:response) { weather.query! }
  let(:datetime) {Time.parse('2014-08-02 05:23:00 +0100')}
  let(:time) {weather.timestamp(datetime)}

  it 'should instantiate correctly' do
    expect(weather).to respond_to :query!
    expect(weather).to respond_to :timestamp
  end

  context 'when calling #timestamp' do
    it 'should turn DateTime into just the time' do
      expect(time).to eql('05:23:00')
    end
  end

  context 'when calling #query' do
    it 'should return a valid hash' do
      expect(response).to be_a_kind_of(Hash)
      expect(response).to include(:temp)
      expect(response).to include(:sunrise)
      expect(response).to include(:sunset)
      expect(response).to include(:high)
      expect(response).to include(:low)
      expect(response).to include(:wind)
      expect(response).to include(:chill)
    end
  end
end
