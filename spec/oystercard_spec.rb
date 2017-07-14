require 'oystercard'

describe Oystercard do
  subject(:oystercard) {Oystercard.new}
  let(:amount) {5}

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

  it 'reduces the balance by the fare amount' do
    expect{oystercard.deduct(Oystercard::FARE)}.to change{oystercard.balance}.by(-Oystercard::FARE)
  end

  context 'touching in and out' do
    it 'responds to #touch_in' do
      expect(oystercard).to respond_to :touch_in
    end

    it 'responds to #touch_out' do
      expect(oystercard).to respond_to :touch_out
    end
  end

end
