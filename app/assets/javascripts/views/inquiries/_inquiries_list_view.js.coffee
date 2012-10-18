class MyFirstProjectServer.Views.InquiriesListView extends Backbone.View
  render: ->
    _.each(
      @model.models
      (inquiry) ->
        link = new MyFirstProjectServer.Views.InquiryLink(model: inquiry)
        $(@el).append(link.render().el)
      this
    )
    this
