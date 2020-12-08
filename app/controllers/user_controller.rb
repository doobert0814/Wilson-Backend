class UserController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        # user = User.all 
        if params[:email]
        user1 = User.find_by(email: params['email'])
        elsif params[:username]
            user1 = User.find_by(username: params['username'])

        end

        if user1
            render json: user1
        else
            render json: {error: "unable to find user"}
        end
    end

    def show 
        user = User.find(email: params['email'])
        render json: user
    end

    def create 
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id)
            render json: { user: user, jwt: token }
            
        else
            render json: { errors: user.errors.full_messages }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :username, :password)
    end
end
