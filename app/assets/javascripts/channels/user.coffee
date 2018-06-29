App.room = null

current_room_ch = ->
  if $('#js-login').length == 1
    true
  else
    false

# リンクのクリックによりAjaxリクエストが呼ばれたら購読を解除
document.addEventListener 'turbolinks:request-start', ->
  if current_room_ch()?
    App.room.unsubscribe()

# ページのロードが終わったら購読開始
document.addEventListener 'turbolinks:load', ->
  if current_room_ch()?
    App.room = App.cable.subscriptions.create { channel: 'UserChannel' },
      received: (data) ->
        $('#js-message-list').prepend data['message']
