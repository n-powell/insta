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
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @images = Image.all
    @user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @image = @user.images.find(params[:id])
    @new_comment = @image.comments.new
    @new_comment.user = current_user
    @current_user = current_user
  end

  def edit
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to user_images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_images_path
  end


  private

  def image_params
    params.require(:image).permit(:title, :file)
  end
end
