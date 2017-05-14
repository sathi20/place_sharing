FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    password 'admin123'
    password_confirmation 'admin123'
  end

  factory :friend, parent: :user do
  end
end
