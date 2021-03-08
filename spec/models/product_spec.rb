require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    # validation tests/examples here

    it "validates a product with all four fields set will save successfully" do
      @category = Category.create(name: "Furniture")
      @product = Product.create(name: "Expensive Chair", price: 200, category: @category, quantity: 20)
      count = Product.all.count
      expect(count).to eq(1)
    end

    it "validates the presence of a name" do
      @category = Category.create(name: "Furniture")
      @product = Product.create(price: 200, category: @category, quantity: 20)
      @product.valid?
      @errors = @product.errors.full_messages
      expect(@errors.length).to be(1)
      expect(@errors[0]).to include("Name can't be blank")
    end

    it "validates the presence of a price" do
      @category = Category.create(name: "Furniture")
      @product = Product.create(name: "Red Shirt", category: @category, quantity: 20)
      @product.valid?
      @errors = @product.errors.full_messages
      expect(@errors.length).to be(3)
      expect(@errors[0]).to include("Price cents is not a number")
      expect(@errors[1]).to include("Price is not a number")
      expect(@errors[2]).to include("Price can't be blank")
    end

    it "validates the presence of a quantitiy" do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: "Red Shirt", price: 200, category: @category)
      @product.valid?
      @errors = @product.errors.full_messages
      expect(@errors.length).to be(1)
      expect(@errors[0]).to include("Quantity can't be blank")
    end

    it "validates the presence of a category" do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: "Red Shirt", price: 200, quantity: 20)
      @product.valid?
      @errors = @product.errors.full_messages
      expect(@errors.length).to be(1)
      expect(@errors[0]).to include("Category can't be blank")
    end
  end
end
