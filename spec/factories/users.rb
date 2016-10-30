FactoryGirl.define do 
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do 
    first_name "User"
    last_name "Example"
    email {generate :email}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "Example"
    email {generate e:mail}
    password "foobar"
    password_confirmation "foobar"
  end
end