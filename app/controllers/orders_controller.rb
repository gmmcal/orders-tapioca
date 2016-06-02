class OrdersController < ApplicationController
  # GET /orders/1
  # GET /orders/1.json
  def index
    @order = Order.first
  end

  # GET /orders/new
  def new
    @order = Order.new
    products = Product.all
    products.each do |product|
      @order.items << Item.new(product: product)
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order was successfully created.' }
      else
        products = Product.all
        products.each do |product|
          @order.items << Item.new(product: product)
        end
        format.html { render :new }
      end
    end
  end

  def close
    Order.find(params[:id]).close
    redirect_to orders_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :observations, items_attributes: [:product_id, :quantity])
    end
end
