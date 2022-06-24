require "test_helper"

class FlatTest < ActiveSupport::TestCase
  test 'validate existence' do
    flat = Flat.new()  
    flat.name = 'new'
    flat.latitude = 8.1234123
    flat.longitude = 112.12314123
    assert flat.save

    flat = Flat.new()
    flat.name = '' 
    flat.latitude = 8.123412
    flat.longitude = 112.123412
    assert_not flat.save

    flat = Flat.new()
    flat.name = 'asdf' 
    flat.latitude = 'a string'
    flat.longitude = 112.123412
    assert_not flat.save

    flat = Flat.new()
    flat.name = 'asdf' 
    flat.latitude = 8.1345648
    flat.longitude = 'a string'
    assert_not flat.save

    flat = Flat.new(latitude: 8.123412, longitude: 112.123412)
    assert_not flat.save

    flat = Flat.new(name: 'asdf', longitude: 112.123412)
    assert_not flat.save

    flat = Flat.new(name: 'asdf', latitude: 112.123412)
    assert_not flat.save
  end



  
end
