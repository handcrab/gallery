class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: Rails.application.secrets.admin_login,
                               password: Rails.application.secrets.admin_pwd,
                               except: [:show, :index]

  # GET /albums
  def index
    @albums = Album.all
  end

  # GET /albums/1
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
    @images = @album.images.build # Array.new(3) { @album.images.build }
  end

  # GET /albums/1/edit
  def edit
    @album.images.build

    respond_to do |format|
      format.html
      format.js
    end
  end

  def append_image
    @album ||= Album.new
    respond_to do |format|
      format.js
    end
  end

  # POST /albums
  def create
    @album = Album.new album_params

    # raise
    if @album.save
      redirect_to @album, notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /albums/1
  def update
    # raise
    if @album.update album_params
      redirect_to @album, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.'
  end

  private

  def set_album
    @album = Album.find params[:id]
  end

  def album_params
    params.require(:album).permit :title,
                                  :description,
                                  images_attributes:
                                  [:id, :description, :picture, :_destroy]
  end
end
