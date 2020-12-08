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
        # byebug
        # if Movie.find(params[:favorite][:movie_id]) && User.find(params[:favorite][:user-id])
        #     new_favorite = Favorite.create(favorite_params)
        # else
        #     new_favorite = favorite_params
        # end
        # render json: new_favorite
    end

    def destroy
        favorite = Favorite.find(params[:id])
        favorite.destroy
        render json: favorite
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:title, :user_id)
    end

end