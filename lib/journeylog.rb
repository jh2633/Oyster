require_relative 'journey'
class Journeylog

 def initialize(journey_class: 'station' )
    @journey_class = journey_class
    @journeys = []
 end

 def start(station)
   journey = Journey.new
  #  journey.start(station)
  #  @journey_class.start(station)
   @journeys << {start_station: station, end_station: nil}

 end

 def finish(station)
   journey.finish(station)
   journey.fare
   @journeys[-1][:end_station] = station
 end

attr_reader :journey_class

 def journeys
   @journeys.dup
 end
end
