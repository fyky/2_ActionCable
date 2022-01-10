class RoomsController < ApplicationController
  def create
    @room = Room.create
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
  end
end
