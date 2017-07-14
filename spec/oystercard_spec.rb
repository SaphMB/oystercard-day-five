require 'oystercard'

describe Oystercard do
  subject(:oystercard) {Oystercard.new}
  let(:amount) {5}
  let(:station) { double(:station) }

  it 'shows that there is money on a card' do
    oystercard.top_up(amount)
    expect(oystercard.balance).to eq amount
  end

  context '#top_up_check' do
    it 'does not allow a single top up to exceed maximum balance' do
      expect {oystercard.top_up(Oystercard::MAXIMUM_BALANCE + amount)}.to raise_error "Cannot exceed maximum balance"
    end
    it 'does not allow multiple top ups to exceed maximum balance' do
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE )
      expect {oystercard.top_up(amount)}.to raise_error "Cannot exceed maximum balance"
    end
  end

  context 'touching in and out with money' do
    before {oystercard.top_up(amount)}

    it 'responds to #touch_in' do
      expect(oystercard).to respond_to :touch_in
    end

    it 'deducts fare when touching out' do
      oystercard.touch_in(station)
      expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-Oystercard::FARE)
    end
  end

  context 'touching in without money' do
    it 'raises an error' do
      expect{oystercard.touch_in(station)}.to raise_error "Insufficient balance"
    end
  end

  context '#journey_history' do
    it 'starts with an empty journey_history' do
      expect(oystercard.journey_history).to be_empty
    end
    it 'after a journey, journey_history contains a journey' do
      oystercard.top_up(amount)
      oystercard.touch_in(station)
      oystercard.touch_out(station)
      expect(oystercard.journey_history[0]).to be_a(Journey)
    end
  end
end
