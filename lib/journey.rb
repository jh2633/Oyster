class Journey

  attr_reader :start, :journey, :complete

  START = 'start'
  EXIT = 'end'
  MINIMUM_FARE = 1
  PENALTY = 6

  def initialize(start = START)
    @start = start
    @journey = {entry: @start , exit: @exit}
    @exit = nil
  end

  # def start_check
  #   if !@start.nil?
  #     @start = start
  #     PENALTY
  #   else
  #     @start = start
  #   end
  #
  # def end_check
  #   if @start.nil?
  #     PENALTY
  #   else
  #     MINIMUM_FARE
  #   end


  def start_check
    if @complete == false
      PENALTY
    else
      @complete = false
    end
  end

  def complete?
    @complete
    # if !@start.nil? && !@exit.nil?
    #   true
    # else
    #   false
    # end
  end

  def pen_fare
    PENALTY
  end

  def fare
    MINIMUM_FARE
  end

  def finish_check(exit = EXIT)
      @exit = exit
    if @complete.nil?
      PENALTY
    else
      @complete = true
      MINIMUM_FARE
    end
  end

end
