# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@setup_websocket = () ->
  @dispatcher = new WebSocketRails(window.location.host + "/websocket")
  return

@trigger = () ->
  console.log "trigger reached"
  task =
    msg: $("#message_input").val()
    number: 1
  @dispatcher.trigger 'websocket.create_success', task
  console.log "trigger completed"
  return

@bind = () ->
  console.log "bind reached"
  @dispatcher.bind 'websocket.event', (task) ->
    $(".additional_content").append("<li>" + task.msg + "</li>")
  console.log "bind completed"
  return

@setup_channel = () ->
  channel = @dispatcher.subscribe('channel');
  channel.bind 'event', (task) ->
    $(".additional_content").append("<li>" + task.msg + "</li>")
  return

$(document).ready ->
  # get_room_number()
  setup_websocket()
  bind()
  setup_channel()
