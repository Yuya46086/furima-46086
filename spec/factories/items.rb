FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png')
    end

    association :user

    name              { 'テスト商品' }
    description       { 'テスト商品の説明文です。' }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    shipping_date_id  { 2 }
    price             { 500 }
  end
end
