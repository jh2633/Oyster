
# => Knows everything about a journey
class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

attr_reader :entry_station
attr_reader :journeys
  def initialize
    @in_journey = false
    @entry_station = nil
    @end_station = nil
  end


  def entry(station)
    @in_journey = true
    @entry_station = station
  end

  def finish(station)
    @in_journey = false
    @end_station = station
  end

  def fare
    if @entry_station.nil? || @end_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

private

  attr_accessor :in_journey

end
