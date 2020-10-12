class UserMailer < ApplicationMailer

	# Initial email linking to appointment form
	def mail_activation(email)
		@url = 'localhost:3000/check'
    	mail(to: email, subject: "Activation Link")
  	end

  	# Sent to user to confirm appointment time
  	def mail_confirm(email, date)
  		@date = date
  		mail(to: email, subject: "Appointment Confirmed!")
  	end

  	# Sent to repairs@example.com for appointment reservation
  	def mail_reserve(user)
  		@user = user
  		mail(to: "repairs@example.com", subject: "Car Repair Appointment")
  	end

  	# Simple rating sent
  	def mail_rating(rating)
  		@rating = rating
  		mail(to: "repairs@example.com", subject: "Recent Appointment Rated")
  	end
end
