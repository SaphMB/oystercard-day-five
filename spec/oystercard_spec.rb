require 'oystercard'

describe Oystercard do
  subject(:oystercard) {Oystercard.new}
  let(:amount) {5}

  it 'shows that there is money on a card' do
    oystercard.top_up(amount)
    expect(oystercard.balance).to eq amount
  end
end
