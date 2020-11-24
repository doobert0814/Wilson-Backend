class UserController < ApplicationController

    def show 
        user = User.find(params[:id])
        render json: user
    end

    # def create 
    #     user = User.create(name: params["name"], email: params["email"], username: params["username"], password_digest["password_digest"])
    #     byebug
    # end

    def create 
        user = User.new(user_params)
        byebug
        if user.valid?
            user.save
            token = encode_token(user_id: user.id)
            render json: { user: user.to_json(except: [:created_at, :updated_at, :password_digest]), jwt: token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.permit!
        byebug
    end
end
