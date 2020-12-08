class FavoritesController < ApplicationController

    # skip_before_action :authorized

    def index
        favorite = Favorite.where(user_id: @user.id)
        if favorite
        render json: favorite
        else
            render json: []
        end
    end

    def create 

        favorite = Favorite.new(favorite_params)
        favorite.user_id = @user.id

        if favorite.save
        render json: favorite
        else
            render json: {error: "couldnt save, please try again"}
        end
    end

    def destroy
        favorite = Favorite.find(params[:id])
        byebug
        favorite.destroy
        render json: favorite
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:title, :user_id)
    end

end