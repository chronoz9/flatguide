require "test_helper"

class NeighborhoodFlowsTest < ActionDispatch::IntegrationTest
  # GET neighborhoods - get all neighborhoods
  test 'get all nb' do 
    get '/api/neighborhoods'
    assert_response :success
  end

  # POST neighborhoods - add a neighborhood
  test 'create new nb' do 
    post '/api/neighborhoods', params: {name: 'new nb', latitude:1.3123, longitude: 2.3124, radius: 2.4}
    assert_response :success

    post '/api/neighborhoods', 
      params: {name: 'test nb'}
    assert_response :unprocessable_entity

    post '/api/neighborhoods', 
      params: {name: 'test nb', latitude: 9.12341, }
    assert_response :unprocessable_entity

    post '/api/neighborhoods', 
      params: {name: 'test nb', longitude: 1.312423}
    assert_response :unprocessable_entity
  end

  # GET neighborhoods/:id - get a neighborhood
  test 'get single nb' do
    get api_neighborhood_url(Neighborhood.first)
    assert_response :success

    get api_neighborhood_url(0)
    assert_response 404

    get api_neighborhood_url(999)
    assert_response :missing
  end

  # PUT neighborhoods/:id - update a neighborhood
  test 'update single nb' do
    put api_neighborhood_url(Neighborhood.last), params: {radius: 0.5}
    assert_response :success

    put api_neighborhood_url(Neighborhood.last), params: {latitude: 'asdf'}
    assert_response :unprocessable_entity
  end

  # DELETE neighborhoods/:id - delete a neighborhood
  test 'delete single nb' do 
    delete api_neighborhood_url(Neighborhood.last)
    assert_response :success

    delete api_neighborhood_url(999)
    assert_response :missing
  end

  # GET neighborhoods/flats - get flats in neighborhood
  test 'get flats in nb' do 
    get flats_api_neighborhood_url(Neighborhood.first)
    assert_response :success

    get flats_api_neighborhood_url(999)
    assert_response :missing

  end

end
