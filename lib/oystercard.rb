require_relative 'journeylog'

class Oystercard

attr_accessor :journeys

LIMIT = 90
BALANCE = 0
MINIMUM_BALANCE = 1

  def initialize(balance = BALANCE, journeylog = Journeylog.new)
    @balance = balance
    @journeylog = journeylog
  end

  def travel_history
    @journeylog.journeys
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def touch_in(station, newjourney = Journey.new)
    fail 'below minimum balance' if empty?
    deduct(@journeylog.start(station))

  end

  def travel_history
    @journeylog.journeys
  end

  def touch_out(station)

    deduct(@journeylog.finish(station))
    journeylog.finish_journey

  end

  private

  attr_reader :balance, :journeylog

  def deduct(journey)
    @balance -= journey
  end

  def full?(amount)
    @balance + amount > LIMIT
  end

  def empty?
    @balance < MINIMUM_BALANCE
  end

end
