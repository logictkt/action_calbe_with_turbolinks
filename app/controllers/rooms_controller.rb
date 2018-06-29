class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      reder action: :index
    end
  end

  def show
    @room = Room.find(params[:id])
    @comment = @room.comments.build
    @comments = @room.comments.includes(:user).order(created_at: :desc)
  end

  private def room_params
    params[:room].permit(:name)
  end
end
