FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    price { Faker::Number.number(digits: 5) }
    delivery_fee_id { 2 }
    delivery_area_id { 2 }
    delivery_date_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
