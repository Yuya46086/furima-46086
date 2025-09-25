class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]
  before_action :redirect_if_condition_met, only: [:new, :create]

  def new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building,
                                          :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def redirect_if_condition_met
    redirect_to root_path unless @item.user_id != current_user.id
    redirect_to root_path if @item.order
  end
end
