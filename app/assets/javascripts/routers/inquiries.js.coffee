class MyFirstProjectServer.Routers.Inquiries extends Backbone.Router
  routes:
    'new': 'new'
    ':id': 'show'
    '*actions': 'index'

  initialize: ->
    @firstPage = true

  index: ->
    @inquiries = new MyFirstProjectServer.Collections.Inquiries()
    self = this
    @inquiries.fetch
      success: (inquiries) ->
        view = new  MyFirstProjectServer.Pages.InquiriesIndex(model: inquiries)
        self.changePage(view)

  new: ->
    view = new  MyFirstProjectServer.Pages.InquiriesNew()
    @changePage(view)

  show: (id) ->
    inquiry = new MyFirstProjectServer.Models.Inquiry(id: id)
    self = this
    inquiry.fetch
      success: (inquiry) ->
        view = new MyFirstProjectServer.Pages.InquiriesShow(model: inquiry)
        self.changePage(view)

  back: ->
    window.back = true
    window.history.back()

  changePage: (page) ->
    $(page.el).attr('data-role', 'page')
    page.render()
    $('body').append(page.el)

    revserse = false
    transition = $.mobile.defaultPageTransition

    if @firstPage
      transition = 'none'
      @firstPage = false

    if window.back
      reverse = true
      window.back = false

    $.mobile.changePage $(page.el),
      changeHash:false
      transition: transition
      reverse: reverse
      reloadPage: true

    $("div").trigger("create")
