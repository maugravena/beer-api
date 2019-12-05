FactoryBot.define do
  factory :beer do
    style { Faker::Beer.style }
    min_temperature { rand(-11..0) }
    max_temperature { rand(1..15) }
  end
end
