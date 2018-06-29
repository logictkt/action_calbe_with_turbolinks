class CommentsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @comment = @room.comments.new(comment_params.merge(user: current_user))
    @comment.save
  end

  private def comment_params
    params[:comment].permit(:body)
  end
end
