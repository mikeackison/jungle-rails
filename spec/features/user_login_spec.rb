require "rails_helper"

RSpec.feature "User can navigate to login page", type: :feature, js: true do
  before :each do
    @user = User.create! first_name: "Danny", last_name: "Brown", email: "d@b.com", password: "password", password_confirmation: "password"
  end

  scenario "when they enter their credentials, the are able to login" do
    # ACT
    visit "/login"

    fill_in "email", with: "d@b.com"

    fill_in "password", with: "password"

    click_button "Submit"

    # VERIFY
    # puts page.html
    expect(page).to have_text "Signed in as Danny"
    # DEBUG
    sleep(1)
    save_screenshot("test4.png")
  end
end
