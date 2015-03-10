class ImagesController < ApplicationController
  # before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  def index
    @images = Image.all
  end
end
