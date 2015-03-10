class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: Rails.application.secrets.admin_login,
                               password: Rails.application.secrets.admin_pwd,
                               except: [:show, :index, :show_or_set]

  # GET /pages/1
  def show
  end

  # def welcome
  #   # @page = Page.find_by title: 'welcome'
  #   @page = Page.where("title like ?", "%welcome%").first
  #   if @page
  #     render :show
  #   else
  #     @page = Page.new title: 'Welcome'
  #     # redirect_to new_page_path, alert: 'Create a welcome page first!'
  #     flash.now[:alert]= 'Create a welcome page first!'
  #     render :new
  #   end
  # end

  def show_or_set
    # like params[:id]
    @page = Page.where('title like ?', '%about%').first
    if @page
      render :show
    else
      @page = Page.new title: 'About'
      flash.now[:alert] = 'Create About page first!'
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
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to @page }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    respond_to do |format|
      if @page.update page_params
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to @page }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    respond_to do |format|
      flash[:notice] = 'Page was successfully destroyed.'
      format.html { redirect_to root_path }
    end
  end

  private

  def set_page
    @page = Page.friendly.find params[:id].to_s.downcase
  end

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
