require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe 'addressの保存' do
    context 'addressが保存できるとき' do
      it '全ての項目が入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'user_idがあれば保存できる' do
        @purchase_address.user_id = 1
        expect(@purchase_address).to be_valid
      end
      it 'item_idがあれば保存できる' do
        @purchase_address.item_id = 1
        expect(@purchase_address).to be_valid
      end
      it 'post_codeが３桁-４桁であれば保存できる' do
        @purchase_address.post_code = '123-4567'
        expect(@purchase_address).to be_valid
      end
      it 'prefectureが---以外であれば保存できる' do
        @purchase_address.prefecture_id = 2
        expect(@purchase_address).to be_valid
      end
      it 'cityがあれば保存できる' do
        @purchase_address.city = '横浜市'
        expect(@purchase_address).to be_valid
      end
      it 'house_numがあれば保存できる' do
        @purchase_address.house_num = '青山1-1-1'
        expect(@purchase_address).to be_valid
      end
      it 'buildingがあっても保存できる' do
        @purchase_address.building = '柳ビル103'
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
      it 'phone_numが11桁で-がなければ保存できる' do
        @purchase_address.phone_num = '12345678901'
        expect(@purchase_address).to be_valid
      end
      it 'phone_numが10桁で-がなければ保存できる' do
        @purchase_address.phone_num = '1234567890'
        expect(@purchase_address).to be_valid
      end
    end

    context 'addressが保存できないとき' do
      it 'user_idが空だと保存できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空だと保存できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁-4桁でないと保存できない' do
        @purchase_address.post_code = '123_4567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空だと保存できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが---だと保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numが空だと保存できない' do
        @purchase_address.house_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'phone_numが空だと保存できない' do
        @purchase_address.phone_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが12桁以上だと保存できない' do
        @purchase_address.phone_num = '123456789123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numが9桁以下だと保存できない' do
        @purchase_address.phone_num = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numに-があると保存できない' do
        @purchase_address.phone_num = '123-1234-1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end
      it 'tokenが空だと保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
