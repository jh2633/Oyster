require_relative 'journeylog'

class Oystercard

attr_accessor :journeys, :journeylog, :current_journey

LIMIT = 90
BALANCE = 0
MINIMUM_BALANCE = 1

  def initialize(balance = BALANCE, journeylog = Journeylog.new)
    @balance = balance
    @journeylog = journeylog
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def touch_in(station, newjourney = Journey.new)
    fail 'below minimum balance' if empty?
    deduct(@journeylog.start(station))
    # if !@current_journey.nil?
    #   deduct
    # end
    # @current_journey = newjourney
    # @journeylog.start(station)
    # deduct(@current_journey.fare)
    # @entry_station = station
    # @current_journey.start(station)
  end

  def touch_out(station)
    if @current_journey.nil?
    @current_journey = Journey.new
    end
    deduct
    @journeylog.finish(station)
    @current_journey = nil
#    deduct(amount)
  end

  private

  attr_reader :balance

  def deduct
    @balance -= @current_journey.fare
  end

  def full?(amount)
    @balance + amount > LIMIT
  end

  def empty?
    @balance < MINIMUM_BALANCE
  end

end
