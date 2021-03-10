class Admin::SalesController < ApplicationController
  before_filter :authenticate

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to [:admin, :sales], notice: "Sale created!"
    else
      render :new
    end
  end

  def index
    @sales = Sale.all
    @active_sale = Sale.active.first
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: "Sale deleted!"
  end

  def sale_params
    params.require(:sale).permit(
      :name,
      :percent_off,
      :starts_on,
      :ends_on
    )
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["USERNAME"] && password == ENV["PASSWORD"]
    end
  end
end
