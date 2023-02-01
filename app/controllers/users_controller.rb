class UsersController < ApplicationController

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    def create
        # binding.break
        @user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            username: params[:username],
            password: params[:password]
        )

        if @user.valid?
            render json: @user, status: :created
        else
            render json: { message: @user.errors.full_messages}, status: :bad_request
        end

    end

end
