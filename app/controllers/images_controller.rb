class ImagesController < ApplicationController
  def new
    @user = current_user
    @image = @user.images.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      # add flash success alert
      redirect_to user_images_path(@user)
    else
      # add flash error message
      render :new
    end
  end

  def index
    @images = Image.all
  end

  private

  def image_params
    params.require(:image).permit(:src, :title)
  end
end
