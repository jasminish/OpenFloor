class SlidesController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  def index
     @slides = Slide.all
   end

   def new
     @slide = Slide.new
   end

   def create
     @slide = Slide.new(slide_params)

     if @slide.save
       redirect_to slides_path, notice: "The slide #{@slide.name} has been uploaded."
     else
       render "new"
     end
   end

   def destroy
     @slide = Slide.find(params[:id])
     @slide.destroy
     redirect_to slides_path, notice:  "The slide #{@slide.name} has been deleted."
   end

 private
   def slide_params
     params.require(:slide).permit(:name, :attachment)
   end
end
