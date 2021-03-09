require "rails_helper"

RSpec.feature "Users can visit the home page ", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "when they click on add to cart, their cart total will increase by 1" do
    # ACT
    visit root_path

    first(:button, "Add").click

    # VERIFY

    expect(page).to have_text "My Cart (1)"

    # DEBUG
    sleep(1)
    save_screenshot("test3.png")
  end
end
