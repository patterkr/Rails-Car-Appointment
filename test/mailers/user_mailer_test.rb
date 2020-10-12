require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "should send activation email" do
  	email = UserMailer.mail_activation('test@example.com')

  	assert_emails 1 do
  		email.deliver_now
  	end

  	assert_equal ['repairs@example.com'], email.from
  	assert_equal ['test@example.com'], email.to
  	assert_equal 'Activation Link', email.subject
  	assert_equal read_fixture('activation').join, email.body.to_s
  end

  test "should send confirmation email" do
  	email = UserMailer.mail_confirm('test@example.com', 'today')

  	assert_emails 1 do
  		email.deliver_now
  	end

  	assert_equal ['repairs@example.com'], email.from
  	assert_equal ['test@example.com'], email.to
  	assert_equal 'Appointment Confirmed!', email.subject
  	assert_equal read_fixture('confirm').join, email.body.to_s
  end

  test "should send reservation email" do
  	user = User.new
  	# Making fake data for email
  	user.appt = 'today'
  	user.carmake = 'Nissan'
  	user.carmodel = 'Something'
  	user.caryear = 1998
  	user.email = 'test@example'
  	user.fname = 'John'
  	user.lname = 'Doe'
  	user.ip = '::1'
  	user.phonenum = '1234567890'
  	user.repairs = 'Its just a test'
  	email = UserMailer.mail_reserve(user)

  	assert_emails 1 do
  		email.deliver_now
  	end

  	assert_equal ['repairs@example.com'], email.from
  	assert_equal ['repairs@example.com'], email.to
  	assert_equal 'Car Repair Appointment', email.subject
  	assert_equal read_fixture('reserve').join, email.body.to_s
  end

  test "should send rating email" do
  	email = UserMailer.mail_rating(3)

  	assert_emails 1 do
  		email.deliver_now
  	end

  	assert_equal ['repairs@example.com'], email.from
  	assert_equal ['repairs@example.com'], email.to
  	assert_equal 'Recent Appointment Rated', email.subject
  	assert_equal read_fixture('rating').join, email.body.to_s
  end
end
