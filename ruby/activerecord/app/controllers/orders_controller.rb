class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def show
    render json: Order.find(params[:id])
  end

  def create
    redirect_to Order.create(order_params)
  end

  def update
    Order.find(params[:id]).update(order_params)
  end

  def destroy
    Order.find(params[:id]).destroy
    render plain: ok
  end

  private
    def order_params
      params.require(:order).permit(:name, :price)
    end
end
