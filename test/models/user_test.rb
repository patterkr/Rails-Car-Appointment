require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create user without proper parameters" do
  	user = User.create
  	assert_not user.save, "User was saved"
  end
end
