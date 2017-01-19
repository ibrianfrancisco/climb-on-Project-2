class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :signup, only: [:show]

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to :back, notice: "Your comment was published!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, :user_name)
  end

end
