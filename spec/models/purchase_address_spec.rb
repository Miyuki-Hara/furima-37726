require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先情報の保存' do
    context '配送先の情報が保存できるとき' do
      it '全ての項目が入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
    end
  end
end