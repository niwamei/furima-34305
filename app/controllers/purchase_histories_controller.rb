class PurchaseHistoriesController < ApplicationController
  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    elsif user_signed_in? && @item.purchase_history.present?
      redirect_to root_path
    end
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end