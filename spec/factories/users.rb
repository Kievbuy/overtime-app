FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name 'Snow'
    email 'test@test.com'
    password '123456'
    password_confirmation '123456'
  end
  
  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email 'test2@test.com'
    password '123456'
    password_confirmation '123456'
  end
end