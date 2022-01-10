# サーバーサイドの処理をするファイル
class RoomChannel < ApplicationCable::Channel
  def subscribed
    #クライアントが受信するストリームを設定　クライアント-サーバー間のやり取り
    #stream_from "room_channel_#{params['room']}"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end