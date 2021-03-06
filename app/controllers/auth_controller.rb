class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(email: user_login_params[:email])
        byebug
        if user && user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: user.id })
            render json: { user: user.to_json(except: [:created_at, :updated_at, :password_digest]), jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.permit(:email, :password)
    end
end