FactoryGirl.define do
  factory :location do
    name   { Faker::Address.street_name }
    address { Faker::Address.street_address }
    is_public true
    user
  end
end

