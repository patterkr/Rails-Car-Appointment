# README

I developed this app using rails on macOS 10.15 Catalina using Terminal
I have never developed using rails before so I used this link to set it up: <a href = "https://gorails.com/setup/osx/10.15-catalina"> macOS 10.15 Setup </a>

For dependencies I installed:
ruby ver. 2.7.1
rails ver. 6.0.3.4
mysql ver. 8.0.21
yarn ver. 1.22.10
node ver. 12.19.0

If it is pertinent information I used homebrew to install them all except for rails which I used the gem install command

I then started up mysql using the command "brew services start mysql" in my terminal

Once dependencies are installed and mysql is started clone this repo and cd into it.
Then run "rake db:create" and if everything was set up correctly you can then run "rails server"
If there was an issue with the rake command you may need to run "bundle install" and try again

If you then open up a browser(I used Google Chrome), and type "localhost:3000" in the address bar it should take you to the start of my project.
I did not have time to set up smtp settings for the email system so, I have provided helpful links to Mail Previews whenever emails should be sent out.
The emails that are sent out can also be viewed in the terminal running the server.

After you have tested all of the functionalities provided in my website, you can Ctrl + C out of the server and check out the test cases I have implemented.
The different commands to run all the tests I have implemented are as follows:
rails test test/models/user_test.rb
rails test test/controllers/users_controller_test.rb
rails test test/controllers/home_controller_test.rb
rails test test/mailers/user_mailer_test.rb

The test cases can be viewed in their respective locations called in the "rails test" calls.

Hopefully everything worked. If not please contact me, as I know this app functions fully which would mean there might be an error in my instructions.