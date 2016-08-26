require_relative 'journey'
class Journeylog
NO_PENALTY = 0
 def initialize
    @journey_class = nil
    @journeys = []
 end

 def start(station)
   if !@journey_class.nil?
      @journey_class.fare
   else
     this_journey.entry(station)
     @journeys << {start_station: station, end_station: nil}
     NO_PENALTY
    end
 end

 def finish(station)
   this_journey.finish(station)
   @journeys[-1][:end_station] = station
   this_journey.fare
 end

def finish_journey
  @journey_class = nil
end

attr_reader :journey_class

  def this_journey
    journey_class || @journey_class = Journey.new
  end

 def journeys
   @journeys.dup
 end
end
