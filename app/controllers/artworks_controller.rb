class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    own = user.artworks
    shared = user.shared_artworks
    render json: own + shared
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  rescue
    render text: 'Artwork id is not exists!!!'
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.delete
    render json: artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)

  end
end
