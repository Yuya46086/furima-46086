require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'ニックネームが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したメールアドレスでは登録できない' do
      FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end
    it '@がないメールアドレスは登録できない' do
      user = FactoryBot.build(:user, email: 'testmail.com')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが6文字未満では登録できない' do
      user = FactoryBot.build(:user)
      user.password = '12345'
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが半角英数字混合でない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'password'
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'パスワードとパスワード（確認）が異なる場合は登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = 'password2'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字が空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名字が全角でない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = 'test'
      user.valid?
      expect(user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
    end
    it '名前が空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it '名前が全角でない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = 'test'
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid. Input full-width characters')
    end
    it '名字カナが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it '名字カナが全角（カタカナ）でない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = 'test'
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
    end
    it '名前カナが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '名前カナが全角（カタカナ）でない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = 'test'
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
    end
    it '生年月日が空では登録できない' do
      user = FactoryBot.build(:user)
      user.birth_date = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
