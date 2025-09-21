class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new]

  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.merge(user_id: current_user.id, item_id: @item.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(order_id: @order.id)
  end
end
