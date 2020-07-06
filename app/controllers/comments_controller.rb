class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    topic = Tocic.find(params[:topic_id])
    @comments = Comment.new
    @comments.user_id = current_user.id
    @comments.topic_id = params[:topic_id]

    if @comments.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントできませんでした'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
