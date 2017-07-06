class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @user = @image.user
    @comment = @image.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_image_path(@user, @image)
    else
      redirect_to user_image_path(@user, @image)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    image = @comment.image
    user = image.user
    @comment.destroy
    redirect_to user_image_path(user, image)
  end


  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
