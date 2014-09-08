require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:valid_user) { FactoryGirl.build(:user) }

  it "should have a screenname, first name, last name and location" do
    expect(valid_user).to be_valid
  end

  it "is not valid if password and password confirmation do not match" do
    user = FactoryGirl.build(:user, password_confirmation: "password1")
    expect(user).not_to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a screen name" do
    user = FactoryGirl.build(:user, screenname: nil)
    expect(user).not_to be_valid
  end

  it "can render full name" do
    expect(valid_user.name).to eq("Bob Bobert")
  end

  it "saves slug when created" do
    new_user = FactoryGirl.create(:user, screenname: "Bob the Wiz")
    expect(new_user.slug).to eq("bob-the-wiz")
  end
  
end