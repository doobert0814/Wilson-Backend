class UserController < ApplicationController
    before_action :authorized

    def show 
        user = User.find(params[:id])
        render json: user
    end

    def create 
        user = User.new(user_params)
        byebug
        if user.save
            token = encode_token(user_id: user.id)
            render json: { user: user.to_json(except: [:created_at, :updated_at, :password_digest]), jwt: token }, status: :created
            byebug
        else
            render json: { errors: user.errors.full_messages }, status: :not_acceptable
        end
    end

    private

    def user_params
        byebug
        params.require(:user).permit!
        # (:name, :email, :username, :password, :redirect)
        byebug
    end
end
