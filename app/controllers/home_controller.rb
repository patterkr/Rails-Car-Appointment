class HomeController < ApplicationController
  # Sends initial activation email and redirects to success screen
  def mail_success
  	email = params[:email]
  	UserMailer.mail_activation(email).deliver_now
  	respond_to do |format|
  		format.html { redirect_to '/success', notice: 'Email sent successfully.' }
        format.json { render :show, status: :created, location: '/success' }
  	end
  end
  # Checks if user has created an appointtment
  def ip_check
  	user_ip = request.remote_ip

  	# For testing purposes only!
  	# If IP is explicitly passed then it is a test case
  	unless (params[:ip].nil?)
      database_ip = User.exists?(:ip => params[:ip])
    else
      database_ip = User.exists?(:ip => user_ip)
    end

  	respond_to do |format|
	  	if(database_ip)
		  	format.html { redirect_to '/review' } # If appointment was created redirect to review
		    format.json { render :show, status: :created, location: '/review' }
	  	else
		  	format.html { redirect_to '/form' } # Else send to form to apply for appointment
		    format.json { render :show, status: :created, location: '/form' }
		end
	end
  end
  # Gets users appointment information for corresponding view
  def review
  	# For testing purposes only!
  	# If IP is explicitly passed then it is a test case
  	unless (params[:ip].nil?)
  		@user = User.find_by ip: params[:ip]
    else
    	@user = User.find_by ip: request.remote_ip
    end
  end
  # Allows user to rate and sends email to repairs@example.com
  # Attempted to use ratyrate for actual rating system but was breaking current code
  def rate
  	@rating = params[:rating]
  	UserMailer.mail_rating(@rating).deliver_now
  	respond_to do |format|
  		format.html { redirect_to '/rated', notice: 'Email sent successfully.' } # Small confirmation view
        format.json { render :show, status: :created, location: '/rated' }
  	end
  end
end
