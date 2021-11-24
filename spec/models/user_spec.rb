require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
     it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end
    
    context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

     it 'emailに@を含まなければ登録できない' do
      @user.email = 'testsample.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

     it 'psswordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank", "Password is valid. Include both letters and numbers", "Password confirmation doesn't match Password")
     end

     it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it 'passwordが5文字以下では登録できない' do
      @user.password = 'aa000'
      @user.password_confirmation = 'aa000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it 'passwordに半角英数字が混合していなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is valid. Include both letters and numbers")
     end

     it 'passwordは全角では登録できない' do
      @user.password = 'A A A０００'
      @user.password_confirmation = 'A A A０００'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is valid. Include both letters and numbers")
     end

     it 'passwordは英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is valid. Include both letters and numbers")
     end

     it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters")
     end

     it 'last_nameは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
      @user.last_name = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
     end

     it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters")
     end

     it 'first_nameは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
      @user.first_name = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
     end

     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid. Input full-width katakana characters")
     end

     it 'last_name_kanaは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
      @user.last_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
     end

     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid. Input full-width katakana characters")
     end

     it 'first_name_kanaは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
      @user.first_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
     end

     it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     

    end
  end
end
