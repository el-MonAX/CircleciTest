FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.html_safe_last_name }
    address { FFaker::AddressUS.street_address.gsub(/[\W_]/, '') }
    city { FFaker::Address.city.gsub(/[\W_]/, '') }
    zip { FFaker::AddressUS.zip_code }
    country { FFaker::AddressUS.country.gsub(/[\W_]/, '') }
    phone '+12345678900'
    user
    order
    type { %w[Billing Shipping].sample }
  end
end
