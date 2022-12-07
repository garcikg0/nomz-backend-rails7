class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create
        @user = User.create(
            first_name: user_params[:first_name],
            last_name: user_params[:last_name],
            email: user_params[:email],
            username: user_params[:username],
            password: user_params[:password],
            password_confirmation: user_params[:password_confirmation]
        )
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
