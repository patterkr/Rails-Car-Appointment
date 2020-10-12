require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/'
    assert_response :success
  end

  test "should redirect after sending activation email" do
  	post '/email', params: { email: 'test@example.com' }
  	assert_redirected_to '/success'
  end

  test "should redirect to review" do
  	post '/appointment', params: { appt: '1', carmake: '1', carmodel: '1', caryear: 1, email: '1', fname: '1', ip: '::1', lname: '1', phonenum: '1', repairs: '1' }
  	get '/check', params: { ip: '::1' }
  	assert_redirected_to '/review'
  end

  test "should redirect to form" do
  	get '/check'
  	assert_redirected_to '/form'
  end

  test "should send info to review page" do
  	post '/appointment', params: { appt: '1', carmake: '1', carmodel: '1', caryear: 1, email: '1', fname: '1', ip: '::1', lname: '1', phonenum: '1', repairs: '1' }
  	get '/review', params: { ip: '::1' }
  	assert_response :success
  end

  test "should redirect after sending rating email" do
  	post '/rate', params: { rating: 3 }
  	assert_redirected_to '/rated'
  end
end
