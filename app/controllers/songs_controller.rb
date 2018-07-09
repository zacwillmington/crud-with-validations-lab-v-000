class SongsController < ApplicationController

    def index
        binding.pry
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        binding.pry
        @song = Song.new(song_params)
        if @song.save
            redirect_to :show
        else
            render :edit
        end
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        if @song.save
            redirect_to :show
        else
            render :edit
        end
    end

    def delete
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :year_release, :artist_name, :genre)
    end

end
