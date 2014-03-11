
```
def land_plane(plane)
  raise "Airport is full" if full?
  raise "Cannot land in stormy weather" if weather == "stormy"
  planes << plane
  plane.land
end
```

What if the plane doesn't land?

Is weather the responsibility of the airport?
What if we created a new class Weather? How would we colaborate with it?


# PASS
