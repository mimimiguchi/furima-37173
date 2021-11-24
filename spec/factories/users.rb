FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'aaa000'}
    password_confirmation {password}
    last_name             {'あ'}
    first_name            {'あ'}
    last_name_kana        {'ア'}
    first_name_kana       {'ア'}
    birthday              {'1930-01-01'}
  end
end