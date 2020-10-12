# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def mail_activation
		UserMailer.mail_activation(User.last)
	end
	def mail_confirm
		UserMailer.mail_confirm(User.last.email, User.last.appt)
	end
	def mail_reserve
		UserMailer.mail_reserve(User.last)
	end
end
