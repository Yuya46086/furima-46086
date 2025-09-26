class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address_line
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A[0-9]+\z/ }

  def save
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    item_price = Item.find(item_id).price
    Payjp::Charge.create(
      amount: item_price,
      card: token,
      currency: 'jpy'
    )
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address_line: address_line,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
    true
  rescue Payjp::PayjpError => e
    Rails.logger.error "Payjp Error: #{e.message}"
    errors.add(:base, '決済処理に失敗しました。カード情報をご確認ください。')
    false
  end
end
