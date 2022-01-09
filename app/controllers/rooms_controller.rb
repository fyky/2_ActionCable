class RoomsController < ApplicationController
  def create
    @room = Room.create
  end

  def show
    @room = Room.find(params[:id])
  end
end
