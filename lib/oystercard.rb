class Oystercard
attr_reader :entry_station
attr_reader :journey_history
DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @max = MAXIMUM_BALANCE
    @min = MINIMUM_BALANCE
    @mininum_fare = 1
    @entry_station = nil

    @journey_history = []
  end

  def top_up(amount)
    fail "Exceed maximum balance of #{@max}" if (@balance + amount) > @max
    @balance += amount
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(station)
    fail "Minimum balance required" if @balance < @min
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(mininum_fare)
    rec_journey(exit_station)
    @entry_station = nil
  end

private

def rec_journey(exit_station)
  @journey_history << {entry_station: @entry_station, exit_station: exit_station}
end

def deduct(mininum_fare)
  #@balance = @balance - fare(station.entry_station - station.exit_station)
  @balance -= @mininum_fare
end
attr_reader :mininum_fare
attr_reader :balance

  # def max?
  #   if @balance + > MAXIMUM_BALANCE
  # end

end
