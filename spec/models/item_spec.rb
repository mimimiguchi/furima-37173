require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品を出品できるとき' do
     it '全ての項目が存在すれば出品できる' do
      expect(@item).to be_valid
     end
    end

    context '商品を出品できないとき' do
     it '商品名が空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
     end

     it '商品説明が空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
     end

     it 'カテゴリーが未選択では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
     end

     it '商品の状態が未選択では出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
     end

     it '配送料の負担の情報が未選択では出品できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
     end

     it '発送元の地域の情報が未選択では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end

     it '発送までの日数情報が未選択では出品できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
     end

     it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid. Input half-width characters", "Price is out of setting range")
     end

     it '価格が全角では出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters", "Price is out of setting range")
     end

     it '価格が300円より低いと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
     end

     it '価格が9,999,999円より高いと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
     end

     it '画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     
    end
    
  end
end
