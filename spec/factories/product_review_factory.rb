require "faker"

FactoryBot.define do
  factory :product_review do
    association :product
    association :user

    title { faker.lorem.sentence(word_count: 3) }
    review { faker.lorem.paragraph(sentence_count: 2) }
    rating { rand(1..5) }

    product_name { product.name }
    ip_address { Faker::Internet.ip_v4_address }
    locale { I18n.locale.to_s }

    approved { false }
    show_identifier { false }
  end
end
