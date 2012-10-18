class MyFirstProjectServer.Collections.Inquiries extends Backbone.Collection

  model: MyFirstProjectServer.Models.Inquiry
  url:"#{window.ServerAddress}/inquiries/"
