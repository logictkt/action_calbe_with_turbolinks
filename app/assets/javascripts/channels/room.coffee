App.room = null

current_room_id = ->
  $('#js-room').data('room-id')

current_room_ch = ->
  id = current_room_id()
  if id?
    return {channel: 'RoomChannel', room_id: id}
  else
    return null

# リンクのクリックによりAjaxリクエストが呼ばれたら購読を解除
document.addEventListener 'turbolinks:request-start', ->
  if current_room_ch()?
    App.room.unsubscribe()

# ページのロードが終わったら購読開始
document.addEventListener 'turbolinks:load', ->
  if current_room_ch()?
    App.room = App.cable.subscriptions.create current_room_ch() ,
      received: (data) ->
        $('.js-commnent-list').prepend data['comment']
