
# => Knows everything about a journey
class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

attr_reader :start_station
attr_reader :journeys
  def initialize
    @in_journey = false
    @start_station = nil
    @end_station = nil
  end

  def in_journey?
    !@start_station.nil?
  end

  def start(station)
    self.in_journey = true
    @start_station = station
  end

  def finish(station)
    self.in_journey = false
    @end_station = station
  end

  def fare
    if @start_station.nil? || @end_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

private

  attr_accessor :in_journey

end
