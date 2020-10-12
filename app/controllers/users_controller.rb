class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def user_init
    @user.email = params[:email]
    @user.fname = params[:fname]
    @user.lname = params[:lname]
    @user.phonenum = params[:phonenum]
    @user.caryear = params[:caryear]
    @user.carmake = params[:carmake]
    @user.carmodel = params[:carmodel]
    @user.repairs = params[:repairs]
    @user.appt = params[:appt]
    @user.ip = @user_ip
  end

  # POST /users
  # POST /users.json
  def create
    # Added for testing purposes incase IP is passed
    unless (params[:ip].nil?)
      @user_ip = params[:ip]
    else
      @user_ip = request.remote_ip
    end

    # Blocks multiple entries by one user
    database_ip = User.exists?(:ip => @user_ip)
    if(database_ip)
      respond_to do |format|
        format.html { redirect_to '/review' } # Sends to information review
        format.json { render :show, status: :created, location: '/review' }
      end
    else
      @user = User.new(user_params)
      user_init # Sets values in user using parameters

      respond_to do |format|
        if @user.save
          UserMailer.mail_confirm(@user.email, @user.appt).deliver_now # Confirmation mail to user
          UserMailer.mail_reserve(@user).deliver_now # Email to company providing info
          format.html { redirect_to '/confirmed', notice: 'Appointment successfully created.' } # Appointment confirmed view
          format.json { render :show, status: :created, location: '/confirmed' }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :fname, :lname, :phonenum, :caryear, :carmake, :carmodel, :repairs, :appt, :ip)
    end
end
