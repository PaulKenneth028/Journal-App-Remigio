class ApplicationController < ActionController::Base
    def authenticate_user!
        redirect_to logins_path unless current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end
end
