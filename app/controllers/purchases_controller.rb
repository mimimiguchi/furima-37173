class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item_id, only: [:index, :create]
  before_action :move_to_home, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
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
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def move_to_home
    if current_user.id == @item.user.id || @item.purchase.present? 
      redirect_to root_path
    end
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