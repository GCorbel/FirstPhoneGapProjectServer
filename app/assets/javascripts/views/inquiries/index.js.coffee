class MyFirstProjectServer.Pages.InquiriesIndex extends Backbone.View

  template: JST['inquiries/index']

  render: ->
    $(@el).html(@template(inquiries: @collection))
    list = new MyFirstProjectServer.Views.InquiriesListView(el: $('ul', @el), model: @model)
    list.render()
    this
