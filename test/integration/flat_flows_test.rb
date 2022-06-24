require "test_helper"

class FlatFlowsTest < ActionDispatch::IntegrationTest
  # GET flats - get all flats
  test 'get flats' do
    get '/api/flats'
    assert_response :success
  end

  # POST flats - add a flat
  test 'post flats' do
    post '/api/flats', 
      params: {name: 'test flat', latitude: 9.12341, longitude: 1.312423}
    assert_response :success

    post '/api/flats', 
      params: {name: 'test flat'}
    assert_response :unprocessable_entity

    post '/api/flats', 
      params: {name: 'test flat', latitude: 9.12341, }
    assert_response :unprocessable_entity

    post '/api/flats', 
      params: {name: 'test flat', longitude: 1.312423}
    assert_response :unprocessable_entity
  end

  # GET flats/:id - get a flat
  test 'get single flat' do
    get api_flat_url(Flat.first)
    assert_response :success

    get api_flat_url(0)
    assert_response 404

    get api_flat_url(999)
    assert_response :missing
  end

  # PUT flats/:id - update a flat
  test 'update single flat' do
    put api_flat_url(Flat.last), params: {name: 'test update'}
    assert_response :success

    put api_flat_url(Flat.last), params: {latitude: 'asdf'}
    assert_response :unprocessable_entity
  end

  # DELETE flats/:id - remove a flat
  test 'delete single flat' do 
    delete api_flat_url(Flat.last)
    assert_response :success  

    delete api_flat_url(999)
    assert_response :missing
  end

  # GET flats/:id/users - get flat users
  test 'get flat users' do 
    get users_api_flat_url(Flat.first)
    assert_response :success

    get users_api_flat_url(999)
    assert_response :missing

    get users_api_flat_url('a')
    assert_response :missing
  end
end
