FactoryBot.define do
  factory :purchase_address do
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_num { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone_num { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
    user_id { FactoryBot.create(:user) }
    item_id { FactoryBot.create(:user).id }
  end
end