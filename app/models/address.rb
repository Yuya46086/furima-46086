class Address < ApplicationRecord
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address_line
    validates :phone_number
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
