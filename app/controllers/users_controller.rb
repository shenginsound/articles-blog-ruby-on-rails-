class UsersController < ApplicationController 

    before_action :set_user, only: [ :show, :edit, :update, :destroy]
    before_action :required_user, only: [ :edit, :update ]
    before_action :require_same_user, only: [ :edit, :update, :destroy ]

    def show
        @user = User.find(params[:id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    
    end    

    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account has updated successfully"
            redirect_to user_path(@user)
        else
            render 'edit'
        end    
        

    
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Alpha Blog #{@user.user_name}, You've created new account succefully"
            redirect_to articles_path
        else
            render 'new'
        end   
    end

    def destroy
        if 
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Your account and associated articles are deleted succeffully"
        redirect_to articles_path
    end

    

    private 

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:user_name, :email, :password)
    end

    
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end
end