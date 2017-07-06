class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @user = @image.user
    @comment = @image.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      byebug
      redirect_to user_image_path(@user, @image)
    else
      byebug
      redirect_to user_image_path(@user, @image)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
