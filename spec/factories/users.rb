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

  factory :admin_user, class: "User" do
    first_name "None"
    last_name "Authorized"
    email {generate :email}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :non_authorized_user, class: "User" do
    first_name "Unauthorized"
    last_name "User"
    email {generate :email}
    password "foobar"
    password_confirmation "foobar"
  end
end