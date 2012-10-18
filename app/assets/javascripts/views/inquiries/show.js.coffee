class MyFirstProjectServer.Pages.InquiriesShow extends Backbone.View

  events:
    "click .back": "back"

  template: JST['inquiries/show']

  render: ->
    $(@el).html(@template(@model.toJSON()))

  back: ->
    MyFirstProjectServer.router.back()
