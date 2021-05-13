FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password { password }
    password_confirmation { password }
    japanese_user = Gimei.name
    last_name { japanese_user.last.kanji }
    first_name { japanese_user.first.kanji }
    last_name_kana { japanese_user.last.katakana }
    first_name_kana { japanese_user.first.katakana }
    birthday { Faker::Date.birthday }
  end
end
