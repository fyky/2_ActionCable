#クライアントサイドの処理をするファイル

# ページのロード時に有効にするために必要
document.addEventListener 'turbolinks:load', ->

App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #messages_allから抜き出したmessageを追加する
    alert data['message']
    # $('#messages_all').append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    #performメソッドでブラウザから入力されたデータをサーバーサイドへ送信
    @perform 'speak', message: message

  # 'keypress' キーが押された時発火する
  $(document).on 'keypress', '[data-behavior~=room_speak]', (event) ->
  # key13= returnキー
    if event.keyCode is 13
      # event.target.valueは入力されたデータ
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()