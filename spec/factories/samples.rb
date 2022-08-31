FactoryBot.define do
  factory :sample do
    codebar { Faker::Number.number(digits: 10)  }
    description { Faker::Name.name }
    born_at { Faker::Date.birthday(max_age: 90) }
    gender { Faker::Gender.binary_type }
    colected_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
