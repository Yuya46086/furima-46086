FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { 'テスト市' }
    address_line  { 'テスト住所' }
    building      { 'テスト建物' }
    phone_number  { '09012345678' }
  end
end
