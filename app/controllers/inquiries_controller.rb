class InquiriesController < ApplicationController
  def index
    render json: Inquiry.all
  end

  def show
    render json: Inquiry.find(params[:id])
  end

  def new
    @inquiry = Inquiry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inquiry }
    end
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      render json: @inquiry, status: :created, location: @inquiry
    else
      render json: @inquiry.errors, status: :unprocessable_entity
    end
  end

  def options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT. DELETE'
    headers['Access-Control-Allow-Headers'] = 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end
