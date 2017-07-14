class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    top_up_check(amount)
    balancetopup(amount)
  end

  def touch_in(station)
    fare_check
    journey = Journey.new(station)
  end

  def touch_out
    deduct
  end

private

  def balancetopup(amount)
    @balance += amount
  end

  def top_up_check(amount)
    raise "Cannot exceed maximum balance" if balance + amount > MAXIMUM_BALANCE
  end

  def deduct(fare = FARE)
    @balance -= fare
  end

  def fare_check
    raise "Insufficient balance" if balance < MINIMUM_FARE
  end

end
