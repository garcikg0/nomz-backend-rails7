class UsersController < ApplicationController
    def create
        binding.break
        # @user = User.create(
        #     first_name: params(:first_name),
        #     last_name: params[:last_name],
        #     username: params [:username],
        #     email: params[:email],
        #     bio: params[:bio],
        #     password: params[:password]
        # )

        # if @user.valid?
        #     render json: user, status: :created
        # else
        #     render json: {error: "Invalid username or password"}, status: :unauthorized
        # end
    end

    def login
        user = User.find_by(email: params[:email])
        binding.break
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    private

    def user_param
        params.permit(:first_name, :last_name, :username, :email, :bio, :password)
    end
end
