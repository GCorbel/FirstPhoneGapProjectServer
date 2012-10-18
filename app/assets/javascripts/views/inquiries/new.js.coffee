class MyFirstProjectServer.Pages.InquiriesNew extends Backbone.View

  events:
    "click .back": "back"
    "click a#capturePhoto": "capturePhoto"
    "click input#submit": "save"

  template: JST['inquiries/new']

  initialize: ->
    console.log "test"
    @model = new MyFirstProjectServer.Models.Inquiry()


  capturePhoto: ->
    options = { quality: 50, destinationType: Camera.DestinationType.DATA_URL }
    navigator.camera.getPicture(@cameraSuccess, @cameraError, options)

  cameraSuccess: (imageData) =>
    image = $('img', @el)
    data = "data:image/jpeg;base64,#{imageData}"
    image.attr("src", data)
    @model.set(data: imageData)
    image.show()

  cameraError: (message) ->
    alert message

  render: ->
    $(@el).html(@template())
    this

  back: ->
    MyFirstProjectServer.router.back()

  save: ->
    @model.set
      title: $('#title').val()
      description: $('#description').val()
    @model.save()
    MyFirstProjectServer.router.index()
