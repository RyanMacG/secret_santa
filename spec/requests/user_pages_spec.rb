require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "invalid signup" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "valid signup" do
      before do
        fill_in "Name",                   with: "Example User"
        fill_in "Email",                  with: "user@example.com"
        fill_in "Password",               with: "foobar"
        fill_in "Confirm your password",  with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end