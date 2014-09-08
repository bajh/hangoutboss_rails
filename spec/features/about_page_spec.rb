require 'rails_helper'

feature "root page" do
before { visit root_path }

  context "when not signed in" do
    it "displays content about website" do
      expect(page).to have_content('About')
    end

    it "includes sign-in form" do
      expect(page).to have_content('Sign In')
    end

    it "allows user to sign in using screen name" do
      FactoryGirl.create(:user)
      fill_in "Screen Name", with: "bobo"
      fill_in "Password", with: "password123"
      click_button "Sign in"
      expect(page).to have_content("Signed in successfully")
    end

    it "includes a link to sign-up form" do
      click_link "Sign up"
      expect(page).to have_content('Confirm Password')
    end
  end

end