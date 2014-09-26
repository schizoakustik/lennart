class GalleriesController < ApplicationController
  
  def index
    @galleries = Gallery.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @galleries }
    end
    
  end
  
  def show
    # @user = User.find(params[:user_id])
    # @gallery = @user.galleries
    
    @gallery = Gallery.find(params[:id])
    @pictures = @gallery.pictures
    
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @gallery }
    end
    
  end
  
  def new
#    user = User.find(params[:user_id])
#    @gallery = @user.galleries.build(user: user)
 
    @gallery = Gallery.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @gallery }
    end
    
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
  end
  
  
  def create
    @gallery = Gallery.new(gallery_params)
    
#    respond_to do |format|
      if @gallery.save
        
        if params[:images]
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
            Rails.logger.debug "DEBUG_GALLERIES_CONTROLLER: " + params[:images].inspect
            }
        end
        flash[:notice] = "successfully created gallery."
        redirect_to @gallery
      else
        flash.now[:alert] = "something went wrong."
        render 'new'
        
#        format.html { redirect_to @gallery, notice: 'gallery was successfully created.' }
#         format.json { render json: @gallery, status: :created, location: @gallery }
#      else
#        format.html { render action 'new' }
#        format.json { render json: @gallery.errors, status: :unprocessable_entity }
#      end
        
    end
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    
    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        format.html { redirect_to @gallery, notice: 'gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end
  
    def destroy
      @gallery = Gallery.find(params[:id])
      @gallery.destroy
      redirect_to galleries_path
      flash[:notice] = "deleted gallery #{@gallery.name}"
            
#      respond_to do |format|
#        format.html { redirect_to galleries_url }
#        format.json { head :no_content }
#      end
    end
      
  private
  def gallery_params
    params.require(:gallery).permit(:description, :name, :pictures)
  end      
end
