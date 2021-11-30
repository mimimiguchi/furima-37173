FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { 'あ市' }
    block { 'い市1-1' }
    building { 'うハイツ101' }
    phone_number { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
