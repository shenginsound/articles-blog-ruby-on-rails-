class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to user_path(user)

        else
            flash.now[:alert] = "There are something wrong with your log in"
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Succesfully Log out"
        redirect_to root_path
    end
end