class SongsController < ApplicationController

  def index
    @songs = Song.order(:title)
    @song = @songs.last
  end

  def new
    @artist = Artist.find(params[:id])
    @song = @artist.songs.new
  end

  def create
    artist = Artist.find(params[:id])
    new_song = artist.songs.create(song_params)
    if new_song.save
      redirect_to("/songs/#{new_song.id}")
    else
      redirect_to "/artists/#{artist.id}/songs/new"
      flash[:notice] = "Title cannot be blank"
    end
  end

  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist_id)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to "/songs/#{@song.id}"
  end

  private
  def song_params
    params.permit(:title)
  end
end
