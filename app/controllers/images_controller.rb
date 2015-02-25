class ImagesController < ApplicationController
  # before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images  
  def index
    @images = Image.all
  end

  # # GET /images/1  
  # def show
  # end

  # # GET /images/new
  # def new
  #   @image = Image.new
  # end

  # # GET /images/1/edit
  # def edit
  # end

  # # POST /images
  # def create
  #   # raise StandardError, params
  #   if album_params
  #     @image = Album.find(album_params[:album_id]).images.build image_params
  #   else
  #     @image = Image.new image_params    
  #   end
       
  #   if @image.save
  #     redirect_to @image, notice: 'Image was successfully created.'   
  #   else
  #     render :new         
  #   end
  # end

  # # PATCH/PUT /images/1  
  # def update
  #   if @image.update image_params
  #       redirect_to @image, notice: 'Image was successfully updated.'         
  #     else
  #       render :edit        
  #   end
  # end

  # # DELETE /images/1  
  # def destroy
  #   @image.destroy
  #   redirect_to images_url, notice: 'Image was successfully destroyed.'    
  # end

  # private    
  #   def set_image
  #     @image = Image.find params[:id]
  #   end
    
  #   def album_params
  #     params.permit :album_id
  #   end

  #   def image_params
  #     # album_params = params.permit(:album_id)
  #     # album_params.merge 
  #     params.require(:image).permit :description, :picture #, album_attributes: [:id]
  #   end
end
