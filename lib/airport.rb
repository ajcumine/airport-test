class Airport

  DEFAULT_CAPACITY = 20

  def planes
    @planes ||= []
  end

  def empty?
    planes.count == 0
  end

  def full?
    planes.count == capacity
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def land_plane(plane)
    raise "Airport is full" if full?
    raise "Cannot land in stormy weather" if weather == "stormy"
    planes << plane
    plane.land      
  end

  def take_off_plane(plane)
    raise "Airport is empty" if empty?
    raise "Cannot take off in stormy weather" if weather == "stormy"
    planes.delete(plane)
    plane.take_off
  end

  def weather
    weather_conditions = ["sunny", "sunny", "sunny", "sunny", "stormy"]
    weather_conditions.sample
  end

end