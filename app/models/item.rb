class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, :description, :category_id, :status_id, :delivery_charge_id, presence: true
  validates :prefecture_id, :delivery_day_id, :price, :image, presence: true

end
