class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_num, :building, :phone_num, :user_id, :item_id, :token

  # buildingについては任意でありテーブル設計上null:falseを付与していないため記述しない。
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_num
    validates :phone_num, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building,
                   phone_num: phone_num, purchase_id: purchase.id)
  end
end
