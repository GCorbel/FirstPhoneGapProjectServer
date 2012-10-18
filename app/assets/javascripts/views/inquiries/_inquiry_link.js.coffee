class MyFirstProjectServer.Views.InquiryLink extends Backbone.View
  tagName: 'li'
  attributes:
    "data-theme": "c"

  render: ->
    $(@el).html("<a href='##{@model.get('id')}'>#{@model.get('title')}</a>")
    this
