class Plane

  def initialize
    take_off
  end

  def fly
    @flying
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end


end