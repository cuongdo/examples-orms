class LineItemsController < ActionController::API
  def create
    LineItem.create(customer_params)
  end

  private
    def line_item_params
      params.require(:line_item).permit(:product, :order)
    end
end
