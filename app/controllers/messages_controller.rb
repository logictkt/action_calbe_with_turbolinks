class MessagesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    UserChannel.broadcast_to user, message: render_message(current_user, params[:title], params[:body])
    redirect_to new_user_message_path(user), notice: 'メッセージを送信しました。'
  end

  private def render_message(user, title, body)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { user: user, title: title, body: body })
  end
end
