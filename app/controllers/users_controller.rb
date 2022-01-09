class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_user_room_user = RoomUser.where(user_id: current_user.id)
    @user_room_user = RoomUser.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_room_user.each do |u|
        @user_room_user.each do |u|
          if cu.room_id == u.room_id then
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
    
      unless @is_room
        @room = Room.new
        @entry = RoomUser.new
      end
    end

  end
end
