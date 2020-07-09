class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:id])
    @song = @artist.songs.new
  end

  def create
    artist = Artist.find(params[:id])
    new_song = artist.songs.create(song_params)
    redirect_to("/songs/#{new_song.id}")
  end

  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist_id)
  end

  private
  def song_params
    params.permit(:title)
  end
end
