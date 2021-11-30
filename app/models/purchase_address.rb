class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  
  validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is valid. Enter it as follows (e.g. 123-4567)"}
  validates :prefecture_id, numericality: {other_than: 1 , message: "can't be blank"}
  with_options presence: true do
    validates :city
    validates :block
  end
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10 , message: 'is too short' }
  validates :phone_number, length: { maximum: 11 , message: 'is too long' }
  validates :phone_number, numericality: { message: 'is invalid. Input only number' }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end