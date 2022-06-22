require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'get all users' do
    get '/api/users'
    assert_response :success
  end

  test 'create user' do
    post '/api/users',
      params: { name: 'flow test 1', email: 'email@email.com' } 
    assert_response :success

    post '/api/users', 
      params: { name: 'flow test 2' } 
    assert_response :unprocessable_entity

    post '/api/users', 
      params: { email: 'flow test 3' } 
    assert_response :unprocessable_entity

    post '/api/users', 
      params: { name: 'fl', email: 'test@test.com' } 
    assert_response :unprocessable_entity

    post '/api/users', 
      params: {  }
    assert_response :unprocessable_entity
  end

  test 'update user' do
    put api_user_url(User.last), params: {name: 'user test'}
    assert_response :success

    put api_user_url(User.last), params: {email: 'user@test.com'}
    assert_response :success

    put api_user_url(User.last), params: {name: 'user test 2', email: 'user@test2.com'}
    assert_response :success

    put api_user_url(User.last), params: {name: 'j2'}
    assert_response :unprocessable_entity

    put api_user_url(User.last), params: {email: User.first.email}
    assert_response :unprocessable_entity
  end

  test 'get a user' do 
    get api_user_url(User.first)
    assert_response :success
  end

  test 'delete user' do
    assert_difference('User.count', -1) do
      delete api_user_url(User.last)
    end
  end

end
