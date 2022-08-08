require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "全ての入力事項があれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上の半角英数字であれば登録できる" do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
      end
      it "first_nameが全角（ひらがな・カタカナ・漢字）であれば登録できる" do
        @user.first_name = '隆太郎'
        expect(@user).to be_valid
      end
      it "last_nameが全角（ひらがな・カタカナ・漢字）であれば登録できる" do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = 'リクタロウ'
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カタカナであれば登録できる" do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
    end  

    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが登録済みのものと重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password（password_confirmation含む）が５文字以下だと登録できない" do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "password（password_confirmation含む）が半角英数字出ないと登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが全角（ひらがな・カタカナ・漢字）でないと登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが全角（ひらがな・カタカナ・漢字）でないと登録できない" do
        @user.last_name = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_kanaが全角カタカナでないと登録できない" do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaが全角カタカナでないと登録できない" do
        @user.last_name_kana = '隆太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

