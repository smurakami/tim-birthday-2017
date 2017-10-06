class Main
  constructor: ->
    @initBackground()
    @initTop()
  initTop: ->
    interval_sec = 0.5
    interval_count = 5

    counter = 0
    setInterval =>
      counter += 1
      if counter % interval_count == 0
        $('#top img.scroll_down').css 'opacity', '0'
      else 
        $('#top img.scroll_down').css 'opacity', '1'
    , interval_sec * 1000 / interval_count
  initBackground: ->
    rotation = 0
    setInterval =>
      rotation += 1
      $('#base img.rolling').css 'transform', "rotate(#{rotation}deg)"
    , 33


layout = ->
  width = $(window).width()
  height = $(window).height()

  max_width = height * 0.7
  if width > max_width
    $('#container').width max_width
    $('#base').width max_width
    $('#container').css 'left', (width - max_width)/2
    $('#base').css 'left', (width - max_width)/2


$ -> 
  new Main

  layout()
  $(window).resize ->
    layout()

window.onload = ->
  $('#container').css 'opacity', 1.0

