class GalleriesController < ApplicationController
  
  def index
    @galleries = Gallery.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @galleries }
    end
    
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    @pictures = @gallery.pictures
    
#    respond_to do |format|
#      format.html #show.html.erb
#      format.json { render json: @gallery }
#    end
    
  end
  
  def new
    @gallery = Gallery.new
 
#    respond_to do |format|
#      format.html #new.html.erb
#      format.json { render json: @gallery }
#    end
    
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
    @pictures = @gallery.pictures
  end
  
  
  def create
     @gallery = Gallery.create(gallery_params)
    
#    respond_to do |format|
      if @gallery.save
        
        if params[:images]
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
            Rails.logger.debug "DEBUG_GALLERIES_CONTROLLER: " + params[image].inspect
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
    
    if @gallery.update(gallery_params)
        
        if params[:images]
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
            Rails.logger.debug "DEBUG_GALLERIES_CONTROLLER: " + params[:images].inspect
            }
        end
        flash[:notice] = "Albumet uppdaterades."
      redirect_to edit_gallery_path(@gallery)
      else
        flash.now[:alert] = "Något gick fel."
        render 'new'
    end
  end
  
    def destroy
      @gallery = Gallery.find(params[:id])
      @gallery.destroy
      redirect_to galleries_path
      flash[:notice] = "Tog bort album #{@gallery.name}"
            
#      respond_to do |format|
#        format.html { redirect_to galleries_url }
#        format.json { head :no_content }
#      end
    end
      
  private
  def gallery_params
    params.require(:gallery).permit(:name, :description, :pictures)
  end      
end
