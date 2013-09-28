# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hornet_mnode, :class => 'Mnode' do
    type ""
    name "MyString"
    file_uid "MyString"
    file_name "MyString"
  end
end
