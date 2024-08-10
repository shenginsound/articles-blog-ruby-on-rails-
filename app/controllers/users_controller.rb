class UsersController < ApplicationController 
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Alpha Blog #{@user.user_name}, You've created new account succefully"
            redirect_to articles_path
        else
            render 'new'
        end   


    end

    private 

    def user_params
        params.require(:user).permit(:user_name, :email, :password)
    end
end