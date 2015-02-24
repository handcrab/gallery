class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages/1  
  def show
  end

  def welcome
    # @page = Page.find_by title: 'welcome'
    @page = Page.where("title like ?", "%welcome%").first
    if @page
      render :show 
    else
      @page = Page.new title: 'Welcome' 
      # redirect_to new_page_path, alert: 'Create a welcome page first!'
      flash.now[:alert]= 'Create a welcome page first!'
      render :new
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages  
  def create
    @page = Page.new page_params

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    respond_to do |format|
      if @page.update page_params
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Page was successfully destroyed.' }
    end
  end

  private
    def set_page
      @page = Page.friendly.find params[:id]
    end

    def page_params
      params.require(:page).permit(:title, :body)
    end
end
