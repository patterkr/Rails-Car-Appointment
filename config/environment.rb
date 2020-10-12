# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# If there is time try to set up actual emailing
=begin
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :domain         => 'mail.google.com',
  :port           => 587,
  :user_name      => 'foo@gmail.com',
  :password       => '******',
  :authentication => :plain,
  :enable_starttls_auto => true
}
=end