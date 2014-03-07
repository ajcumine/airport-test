class Plane

  def initialize
    @flying = true
  end

  def fly
    @flying
  end

  def land(weather_conditions)
    weather_conditions.weather == "sunny" ? @flying = false : @flying = true
  end

  def take_off(weather_conditions)
    weather_conditions.weather == "sunny" ? @flying = true : @flying = false
  end


end