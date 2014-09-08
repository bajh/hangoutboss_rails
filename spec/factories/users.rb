# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.screenname "bobo"
    f.first_name "Bob"
    f.last_name "Bobert"
    f.location "Miami, Fl."
    f.email "bob@foo.com"
    f.password "password123"
    f.password_confirmation "password123"
  end
end