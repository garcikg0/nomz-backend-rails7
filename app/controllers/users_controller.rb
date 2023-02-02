class UsersController < ApplicationController

    skip_before_action :authenticate, only: [:create, :login]

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            @token = encode_token( { user_id: @user.id})
            @serialized_user = UserSerializer.new(@user)
            render json: { user: @serialized_user.attributes, token: @token }
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    def create
        @user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            username: params[:username],
            password: params[:password]
        )

        if @user.valid?
            @token = encode_token({user_id: @user.index})
            @serialized_user = UserSerializer.new(@user)
            render json: { user: @serialized_user.attributes, token: @token }, status: :created
        else
            render json: { message: @user.errors.full_messages}, status: :bad_request
        end

    end

    def autologin
        @serialized_user = UserSerializer.new(@current_user)
        render json: @serialized_user.attributes
    end

end
