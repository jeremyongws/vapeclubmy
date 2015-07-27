class ProductsController < ApplicationController
  def index
  	@products = Product.all
    @current_order = current_order
    @order_item = current_order.order_items.new
  end

  def single
  	@products = Product.first
  end
end
