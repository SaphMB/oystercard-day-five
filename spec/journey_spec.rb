require 'journey'

describe Journey do
  subject(:journey) { Journey.new(station) }
  subject(:station) { double(:station) }

  it "stores the entry station once the journey has started" do
    expect(journey.entry_station).to be station
  end
end
