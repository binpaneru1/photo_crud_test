class ImagesController < ApplicationController
  def image
    @img = Image.find(params[:id])
 end

 def del
   @img = Image.find(params[:id])
   @img.destroy
   redirect_back fallback_location: root_path
 end
end
