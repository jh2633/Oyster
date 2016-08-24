class Journey

  attr_reader :start, :journey

  START = 1

  def initialize(start = START)
    @start = start
    @journey = {entry: 'start' , exit: 'end'}
  end

  def fare
  end

end
