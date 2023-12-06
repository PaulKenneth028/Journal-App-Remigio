class LoginsController < ApplicationController
  def new
  end

  def create
  if (user = User.find_by(username: login_params[:username].downcase)) && user.authenticate(login_params[:password])
    session[:user_id] = user.id 
    redirect_to tasks_path, notice: 'Login successful!'
  else
    flash.now[:alert] = 'Invalid email/password combination'
    render :new
  end
end


  def destroy
    log_out
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end

def login_params
  params.require(:login_form).permit(:username, :password)
end