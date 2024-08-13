class ApplicationController < ActionController::Base
    #by declaring helper_method, the method can be used by view

    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||=User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def required_user
        if !logged_in?
            flash[:alert] = "Please log in to perform that action"
            redirect_to login_path
        end



    end
end
