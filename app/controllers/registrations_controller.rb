class RegistrationsController < ApplicationController
  def index
    @registereduser = Registration.all
  end
  
  def new
    @registereduser = Registration.new
  end

  def create
    @registereduser = Registration.new(user_params)
    if @registereduser.save
      redirect_to login_path, notice: 'Account created successfully'
    else
      flash.now[:error] = "Failed to create an account due to: #{user.errors.full_messages.join(', ')}"
      render :new
    end
  end

  private

  def user_params
    params.require(:registration).permit(:username, :email, :password, :password_confirmation)
  end
end
