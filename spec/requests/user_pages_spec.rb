require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  # describe "signup" do
  #   before { visit signup_path }
  #   describe "with valid information" do
  #     describe "after saving the user" do
  #       before {click_button submit}
  #       let(:user) { User.find_by_email('user@example.com')}
  #       it { should have_selector('title', text: user.name) }
  #       it { should have_selector('div.alert.alert-success', text: 'Welcome') }
  #     end
  #   end
  #
  #   describe "with invalid information" do
  #
  #     describe "after submission" do
  #       before { click_button submit }
  #
  #       it { should have_selector('title', text: 'Sign up') }
  #       it { should have_content('error') }
  #     end
  #   end
  #end
end
