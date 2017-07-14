require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  subject(:station) { double(:station) }

  it "stores the entry station once the journey has started" do
    journey.entry_station=(station)
    expect(journey.entry_station).to be station
  end

  it "stores the exit station" do
    journey.exit_station=(station)
    expect(journey.exit_station).to be station
  end
end
