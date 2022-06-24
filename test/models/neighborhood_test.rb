require "test_helper"

class NeighborhoodTest < ActiveSupport::TestCase
  test 'validate existence' do
    neigh = Neighborhood.new()  
    neigh.name = 'new'
    neigh.latitude = 8.1234123
    neigh.longitude = 112.12314123
    neigh.radius = 1000
    assert neigh.save

    neigh = Neighborhood.new()
    neigh.name = '' 
    neigh.latitude = 8.123412
    neigh.longitude = 112.123412
    neigh.radius = 'a string'
    assert_not neigh.save

    neigh = Neighborhood.new()
    neigh.name = 'asdf' 
    neigh.latitude = 'a string'
    neigh.longitude = 112.123412
    neigh.radius = 1000
    assert_not neigh.save

    neigh = Neighborhood.new()
    neigh.name = 'asdf' 
    neigh.latitude = 8.1345648
    neigh.longitude = 'a string'
    neigh.radius = 1000
    assert_not neigh.save

    neigh = Neighborhood.new(latitude: 8.123412, longitude: 112.123412)
    assert_not neigh.save

    neigh = Neighborhood.new(name: 'asdf', longitude: 112.123412)
    assert_not neigh.save

    neigh = Neighborhood.new(name: 'asdf', latitude: 112.123412)
    assert_not neigh.save
  end
end
