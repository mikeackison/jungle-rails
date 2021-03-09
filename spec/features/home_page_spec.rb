require "rails_helper"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot("test1.png")

    expect(page).to have_css "article.product"
  end
end
