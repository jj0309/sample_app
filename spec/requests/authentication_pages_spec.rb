require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    # visit the signin route
    before { visit signin_path }

    it { should have_selector('h1', text: 'Sign in') } # should contain h1 tag with "sign in" text
    it { should have_selector('title', text: 'Sign in')} # should contain title tag with "sign in" text
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid informations" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid informations" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: user.name)}
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout"do
        before { click_link "Sign out" }
        it { should have_link "Sign in" }
      end
    end
  end
end
