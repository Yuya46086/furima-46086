FactoryBot.define do
  factory :item do
    association :user
    image             { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
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
