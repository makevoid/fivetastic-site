class Overlay
  constructor: ->
    $("html").prepend("<div id='overlay'></div>")
  
  view: ->
    $("#overlay")
    
  content: ->
    elem = this.view().find("div, img")
    $( elem[0] ) if elem
        
  show: ->
    this.view().show()
    _.delay =>
      this.view().css( height: $("html").height() )
      this.content().css( top: "#{$(window).scrollTop()+40}px" )
      this.view().on "click", =>
        this.hide()
    , 10

  hide: ->
    this.view().fadeOut "fast"

  display: (element) ->    
    this.view().html element
    

g = window
$("body").bind "sass_loadeds", ->
  # g.fivetastic.dev_mode() # comment this in production
  $("body").unbind "page_loaded"
  
  overlay = new Overlay()
  
  $(".images img").on "click", ->
    image = $(this).clone()
    overlay.display image
    overlay.show()
  
  
# require_api = (api) ->
#   $.get "/fivetastic/api/lastfm.coffee", (coffee) ->
#     eval CoffeeScript.compile(coffee)
#     
# # APIS: fb, lastfm, delicious, twitter
# require_api "lastfm"



# console.log "app coffee loaded"