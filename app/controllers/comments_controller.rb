class CommentsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :signup, only: [:show]

  def index
    # Don't need?
  end

  def show
    # Don't need?
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
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
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end

end

# user has_many messages
# messages belong_to user
