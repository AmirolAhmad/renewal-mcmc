FactoryBot.define do
  factory :user do
    ic_number { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password {'secret'}
    password_confirmation {'secret'}
  end

  factory :user_with_profile, parent: :user do
    after(:build) do |user|
      user.profile = create(:profile)
    end
  end
end
