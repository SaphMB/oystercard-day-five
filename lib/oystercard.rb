class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    top_up_check(amount)
    balancetopup(amount)
  end

private

  def balancetopup(amount)
    @balance += amount
  end

  def top_up_check(amount)
    raise "Cannot exceed maximum balance" if balance + amount > MAXIMUM_BALANCE
  end
end
