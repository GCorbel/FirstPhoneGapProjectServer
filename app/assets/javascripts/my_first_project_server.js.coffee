window.MyFirstProjectServer =
  Models: {}
  Collections: {}
  Views: {}
  Pages: {}
  Routers: {}
  init: ->
    $.mobile.ajaxEnabled = false
    $.mobile.linkBindingEnabled = false
    $.mobile.hashListeningEnabled = false
    $.mobile.pushStateEnabled = false
    $.mobile.defaultPageTransition = 'slide'
    @router = new MyFirstProjectServer.Routers.Inquiries
    Backbone.history.start()

window.ServerAddress = "http://192.168.20.100:3000"

$(document).ready ->
  MyFirstProjectServer.init() unless window.device

window.onInit = ->
  document.addEventListener("deviceready", onDeviceReady, true) if window.device

window.onDeviceReady = ->
  MyFirstProjectServer.init() if window.device
