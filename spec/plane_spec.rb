require "./lib/plane"

describe Plane do  

let(:plane) {Plane.new}

  it "should be flying when initialised" do
    expect(plane.fly).to eq(true)
  end

  it "should be able to land in good weather" do
    weather_conditions = double(:weather_conditions, { :weather => "sunny"})
    plane.land(weather_conditions)
    expect(plane.fly).to eq(false)
  end

  it "should be able to take off in good weather" do
    weather_conditions = double(:weather_conditions, { :weather => "sunny"})
    plane.land(weather_conditions)
    plane.take_off(weather_conditions)
    expect(plane.fly).to eq(true)
  end

end