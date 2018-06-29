class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "room_channel_#{comment.room_id}", comment: render_comment(comment)
  end

  private def render_comment(comment)
    ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
