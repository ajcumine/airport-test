require "./lib/airport"
require "./lib/plane"

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it "should initialise with no planes" do
    expect(airport).to be_empty
  end

  it "should know when it's full" do
    airport.stub(:weather => "sunny")    
    expect(airport).not_to be_full
    airport.capacity.times {airport.land_plane(plane)}
    expect(airport).to be_full
  end

  it "should not allow planes to land if full" do
    airport.stub(:weather => "sunny")
    airport.capacity.times {airport.land_plane(plane)}
    expect{airport.land_plane(plane)}.to raise_error(RuntimeError)
  end

  it "should not allow planes to take off if empty" do
    airport.stub(:weather => "sunny")
    expect{airport.take_off_plane(plane)}.to raise_error(RuntimeError)
  end

  context "take off and landing in sunny weather" do

    it "a plane can land" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      expect(airport.planes).to eq([plane])
    end

    it "a plane should not be flying when it lands" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      expect(plane.fly).to eq(false)
    end

    it "a plane can take off in sunny weather" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      airport.take_off_plane(plane)
      expect(airport).to be_empty
    end

    it "a plane should fly when it takes off" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      airport.take_off_plane(plane)
      expect(plane.fly).to be(true)
    end

  end

  context "take off and landing in stormy weather" do
    
    it "a plane cannot land in stormy weather" do
      airport.stub(:weather => "stormy")
      expect{airport.land_plane(plane)}.to raise_error(RuntimeError)
    end

    it "a plane cannot take off in stormy weather" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      airport.stub(:weather => "stormy")
      expect{airport.take_off_plane(plane)}.to raise_error(RuntimeError)
    end

  end

end