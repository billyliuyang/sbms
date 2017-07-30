App.emotions = App.cable.subscriptions.create "EmotionsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".currenthr").html(data.html)
