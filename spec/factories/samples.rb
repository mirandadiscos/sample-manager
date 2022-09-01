FactoryBot.define do
  factory :sample do

    trait :nocodebar do
      codebar { "" }
      description { Faker::Name.name }
      born_at { Faker::Date.birthday(max_age: 90) }
    end

    trait :noname do
      codebar { Faker::Number.number(digits: 10)  }
      description { "" }
      born_at { Faker::Date.birthday(max_age: 90) }
    end

    trait :nocolected do
      codebar { Faker::Number.number(digits: 10)  }
      description { Faker::Name.name }
      born_at { "" }
    end

    trait :sample_default do
      codebar { Faker::Number.number(digits: 10)  }
      description { Faker::Name.name }
      born_at { Faker::Date.birthday(max_age: 90) }
    end

    trait :sample_extra do
      gender { Faker::Gender.binary_type }
      colected_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end

    factory :sample_default,   traits: [:sample_default, :sample_extra]
    factory :sample_without_codebar, traits: [:nocodebar]
    factory :sample_without_colected, traits: [:nocolected]
    factory :sample_without_name, traits: [:noname]
  end
end
