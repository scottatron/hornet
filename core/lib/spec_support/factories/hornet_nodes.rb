# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hornet_node, :class => 'Node' do
    type ""
    name "MyString"
    url "MyString"
  end
end
