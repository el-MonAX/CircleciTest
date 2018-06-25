# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@email.com" }
    name 'Jane Doe'
    password 'test123XX'
    after(:build) { |user| user.class.skip_callback(:save, :before) }
  end
end
