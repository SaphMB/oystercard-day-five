require 'station'

describe Station do

  context 'station is not passed a zone' do
    subject(:station) {described_class.new}
    it 'it must have a zone' do
      expect {station}.to raise_error ArgumentError
    end
  end

  context 'station is passed a zone' do
    subject(:station) {described_class.new(zone)}
    let(:zone) {1}
    it 'the zone can be accessed' do
      expect(station.zone).to eq zone
    end
  end

end
