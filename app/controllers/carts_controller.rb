class CartsController < ApplicationController
  def show
  	@current_order = current_order
  	@order_items = current_order.order_items
  end
end
