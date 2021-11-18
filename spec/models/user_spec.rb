require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "should save a user with valid attributes" do 
      @user = User.new(
        name: "Armeen Hadizadeh",
        email: "armeen.hadizadeh@gmail.com", 
        password: "password123",
        password_confirmation: "password123",
      )

      @user.save

      expect(@user).to be_valid
    end

    it "should be invalid if email already exists" do 
      @user = User.new(
        name: "Armeen Hadizadeh",
        email: "armeen.hadizadeh@gmail.com", 
        password: "password123",
        password_confirmation: "password123",
      )

      @user.save

      @user2 = User.new(
        name: "Arms Hadizadeh",
        email: "ARMEEN.hadizadeh@gmail.com",
        password: "password123",
        password_confirmation: "password123"
      )

      @user2.save

      expect(@user2).not_to be_valid
    end

    it "should be invalid if password is shorter than 5 characters" do 
      @user = User.new(
        name: "Armeen Hadizadeh",
        email: "armeen.hadizadeh@gmail.com", 
        password: "123",
        password_confirmation: "123",
      )

      @user.save

      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "should be valid with valid credentials" do
      @user = User.new(
        name: "Armeen Hadizadeh",
        email: "arms123@gmail.com",
        password: "123456",
        password_confirmation: "123456",
      )

      @user.save

      loginInfo = User.authenticate_with_credentials(@user.email, @user.password)

      expect(loginInfo.id).to eq(@user.id)
    end

    it "should be valid with when email has whitespaces" do
      @user = User.new(
        name: "Armeen Hadizadeh",
        email: "arms1234@gmail.com",
        password: "123456",
        password_confirmation: "123456",
      )

      @user.save

      loginInfo = User.authenticate_with_credentials("   aRms1234@gmail.com", @user.password)

      expect(loginInfo.id).to eq(@user.id)
    end

  end
end