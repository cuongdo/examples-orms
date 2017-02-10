class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def show
    render json: Order.find(params[:id])
  end

  def create
    puts Order.attribute_names
    puts params.inspect
    ##### XXX ####
    # I want wrap_parameters to have put the customer: {id: x} thing inside of
    # order:{} hash along with the other stuff
    #X### XXX ####
    puts order_params.inspect

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
      params.require(:order).permit(:subtotal, customer: [:id])
    end
end
