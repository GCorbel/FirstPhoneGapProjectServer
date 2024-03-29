class ApplicationController < ActionController::Base
  after_filter :cors_set_access_control_headers

  protected
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT'
    headers['Access-Control-Max-Age'] = "1728000"
  end
end
