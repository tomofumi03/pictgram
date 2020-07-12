class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment = @topic.contents.build

  end

  def create
    topic = Tocic.find(params[:topic_id])
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]

    if @comment.save
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
