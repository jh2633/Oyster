class Journey

MININUM_FARE = 1
PENALTY_FARE = 6
attr_reader :entry_station
  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    true if !@entry_station.nil? && !@exit_station.nil?
  end

  def fare
    if @entry_station.nil? || @exit_station.nil?
      PENALTY_FARE
    else
      MININUM_FARE
    end
  end

  def finish(station)
    @exit_station = station
    self
  end
end
