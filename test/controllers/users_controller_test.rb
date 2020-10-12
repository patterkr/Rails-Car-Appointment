require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # Default Test Cases
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { appt: @user.appt, carmake: @user.carmake, carmodel: @user.carmodel, caryear: @user.caryear, email: @user.email, fname: @user.fname, ip: @user.ip, lname: @user.lname, phonenum: @user.phonenum, repairs: @user.repairs } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  # Personalized Test Cases
  test "should create new user" do
    assert_difference('User.count') do
      post users_url, params: { appt: '1', carmake: '1', carmodel: '1', caryear: 1, email: '1', fname: '1', ip: '::1', lname: '1', phonenum: '1', repairs: '1' }
    end

    assert_redirected_to '/confirmed' # Checks redirect to confirmation view
  end

  test "should not create another user with same ip" do
    post users_url, params: { appt: '1', carmake: '1', carmodel: '1', caryear: 1, email: '1', fname: '1', ip: '::1', lname: '1', phonenum: '1', repairs: '1' }
    assert_no_difference('User.count') do
      post users_url, params: { appt: '1', carmake: '1', carmodel: '1', caryear: 1, email: '1', fname: '1', ip: '::1', lname: '1', phonenum: '1', repairs: '1' }
    end

    assert_redirected_to '/review' # Checks redirect to review view
  end

end
