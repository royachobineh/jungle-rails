require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Sweater",
        category: @category,
        description: "a warm sweater",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )

      @product.save!

      expect(@product).to be_valid
    end

    it "is invalid without name attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: nil,
        category: @category,
        description: "a warm sweater",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it "is invalid without category attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "water bottle",
        category: nil,
        description: "a warm sweater",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end

    it "is invalid without quantity attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "shirt",
        category: @category,
        description: "a warm sweater",
        quantity: nil,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it "is invalid without name attribute" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "shirt",
        category: @category,
        description: "a warm sweater",
        quantity: 10,
        price: nil, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end
  end

end