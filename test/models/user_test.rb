require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validate existence" do
    user = User.new 
    user.name = 'my name'
    user.email = 'name@email.com'
    assert user.save! 

    user = User.new
    user.name = 'my name'
    assert_not user.save

    user = User.new
    user.email = 'name@email.com'
    assert_not user.save

    user = User.new
    assert_not user.save
  end

  test "name min length" do
    user = User.new
    user.name = 'al'
    user.email = 'asdf@asdf.com'
    assert_not user.save
  end

  test "email unique" do 
    user = User.create(name: 'my name', email: 'email@email.com')
    dup_user = user.dup
    assert_not dup_user.valid?
  end
end
