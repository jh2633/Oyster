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

  def start_check
    if @complete == false
      PENALTY
    else
      @complete = false
    end
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

  def finish_check(exit = EXIT)
    if @complete == true
      PENALTY
    else
      MINIMUM_FARE
    end
    @exit = exit
    @complete = true
  end

end
