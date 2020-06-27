class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    topic = Topic.find(params[:topic_id])
    @comment = topic.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comments.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] ="コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
