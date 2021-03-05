class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all
    @active_sale = Sale.active.first
  end
end
