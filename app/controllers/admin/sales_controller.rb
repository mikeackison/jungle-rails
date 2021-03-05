class Admin::SalesController < ApplicationController
  before_filter :authenticate

  def index
    @sales = Sale.all
    @active_sale = Sale.active.first
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["USERNAME"] && password == ENV["PASSWORD"]
    end
  end
end
