class RoomsController < ApplicationController
  def create
    @room = Room.create
    # RoomUserを2つ作る
    # 自分のRoomUserを作る
    @join_current_user = RoomUser.create(user_id: current_user.id, room_id: @room.id)
    # 相手のRoomUserを作る
    @join_user = RoomUser.create(join_room_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def join_room_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
