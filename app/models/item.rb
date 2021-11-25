class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } 
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range'}
  validates :category_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id, numericality: {other_than: 1 , message: "can't be blank"}

end
