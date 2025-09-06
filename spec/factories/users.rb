FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'test123' }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { 'テスト' }
    last_name_kana        { 'テストカナ' }
    first_name_kana       { 'テストカナ' }
    birth_date            { '2000-01-01' }
  end
end
