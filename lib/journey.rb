class Journey

  attr_reader :start, :journey
  attr_reader :complete

  START = 'start'
  EXIT = 'end'
  MINIMUM_FARE = 1
  PENALTY = 6
  def initialize(start = START)
    @start = start
    @journey = {entry: @start , exit: @exit}

    @exit = nil
  end

  def complete?
    @complete
  end

  def pen_fare
    PENALTY
  end

  def fare
    MINIMUM_FARE
  end

  def complete(exit = EXIT)
    @exit = exit
    @complete = true
  end

end
