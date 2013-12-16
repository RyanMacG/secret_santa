FactoryGirl.define do
  factory :user do
    name     "Test User"
    email    "test@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :group do
    name  "Group 1"
    limit "$15"
    year  "2013"
    user
  end
end