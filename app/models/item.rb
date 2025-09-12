class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one_attached :image

  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
