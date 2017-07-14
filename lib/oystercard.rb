class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90
  FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    top_up_check(amount)
    balancetopup(amount)
  end

  def deduct(fare = FARE)
    balancededuct(fare)
  end

  def touch_in

  end

  def touch_out

  end

private

  def balancetopup(amount)
    @balance += amount
  end

  def top_up_check(amount)
    raise "Cannot exceed maximum balance" if balance + amount > MAXIMUM_BALANCE
  end

  def balancededuct(fare)
    @balance -= fare
  end

end
