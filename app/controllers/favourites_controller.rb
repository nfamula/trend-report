class FavouritesController < ApplicationController

  before_filter :restrict_access

  def index
    @user = current_user
    @favourite = Favourite.all
  end

  def create
    @favourite = Favourite.new
    @favourite.title = params[:title]
    @favourite.url = params[:url]
    @favourite.image = params[:image]
    @favourite.source = params[:source]
    @favourite.category = params[:category]
    @favourite.user_id = current_user.id
    if @favourite.save
      redirect_to user_favourites_path
    end
  end

  def destroy
    @favourite = Favourite.find_by(id: params[:id])
    @favourite.delete
    if @favourite.delete
      redirect_to user_favourites_path
    end
  end
end
