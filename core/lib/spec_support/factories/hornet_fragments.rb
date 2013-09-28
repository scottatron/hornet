# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hornet_fragment, :class => 'Fragment' do
    type ""
    node nil
    mnode nil
    key "MyString"
    value "MyText"
  end
end
