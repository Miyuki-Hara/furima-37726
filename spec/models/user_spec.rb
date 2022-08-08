require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空だと登録できない" do
    end
    it "emailが登録済みのものと重複していると登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "password（password_confirmation含む）が５文字以下だと登録できない" do
    end
    it "password（password_confirmation含む）が半角英数字出ないと登録できない" do
    end
    it "password_confirmationが空だと登録できない" do
    end
    it "first_nameが全角（ひらがな・カタカナ・漢字）でないと登録できない" do
    end
    it "last_nameが全角（ひらがな・カタカナ・漢字）でないと登録できない" do
    end
    it "first_name_kanaが全角カタカナでないと登録できない" do
    end
    it "last_name_kanaが全角カタカナでないと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
end

