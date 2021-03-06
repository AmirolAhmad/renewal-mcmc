FactoryBot.define do
  factory :profile do
    association :user, factory: :user
    fullname { Faker::Name.name }
    address { Faker::Address.street_address }
    postcode { Faker::Address.postcode }
    city { Faker::Address.city }
    state { Faker::Address.state }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
