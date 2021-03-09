require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should validate an new user when passwords match" do
      user = User.create(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it "should not validate an new user when passwords don't match" do
      user = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "passworb", password_confirmation: "password")
      user.valid?
      errors = user.errors.full_messages
      expect(errors.length).to be(1)
      expect(errors[0]).to include("Password confirmation doesn't match Password")
    end

    it "should not validate a new user when passwords are blank" do
      user = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "", password_confirmation: "")
      user.valid?
      expect(user).to_not be_valid
      errors = user.errors.full_messages

      expect(errors[1]).to include("Password can't be blank")
    end

    it "should not validate if email is not unique" do
      user1 = User.create(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "password", password_confirmation: "password")
      user2 = User.create(first_name: "Mike", last_name: "Ackison", email: "m@a.COM", password: "password", password_confirmation: "password")
      user1.save
      user2.save
      errors = user2.errors.full_messages
      expect(errors.length).to be(1)
      expect(errors[0]).to include("Email has already been taken")
    end

    it "should require an email" do
      user = User.new(first_name: "Mike", last_name: "Ackison", email: "", password: "password", password_confirmation: "password")
      user.valid?
      errors = user.errors.full_messages
      expect(errors.length).to be(1)
      expect(errors[0]).to include("Email can't be blank")
    end

    it "should require a first and last name" do
      user = User.create(first_name: "", last_name: "", email: "m@a.com", password: "password", password_confirmation: "password")
      user.valid?
      errors = user.errors.full_messages
      expect(errors.length).to be(2)
      expect(errors[0]).to include("First name can't be blank")
      expect(errors[1]).to include("Last name can't be blank")
    end

    it "should require a password with a minimum length" do
      user = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "pass", password_confirmation: "pass")
      user.valid?
      errors = user.errors.full_messages
      expect(errors.length).to be(1)
      expect(errors[0]).to include("Password is too short (minimum is 5 characters)")
    end

    describe ".authenticate_with_credentials" do
      # examples for this class method here
      it "should log in the user if authentification is correct" do
        user1 = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "password", password_confirmation: "password")

        user1.save

        user2 = User.authenticate_with_credentials("m@a.com", "password")
        expect(user1).to eql(user2)
      end

      it "should not log in the user if authentification is incorrect" do
        user1 = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "password", password_confirmation: "password")

        user1.save

        user2 = User.authenticate_with_credentials("m@a.com", "banana")
        expect(user1).to_not eql(user2)
      end

      it "should log in the user if authentification correct but there are whitespaces in the email feild" do
        user1 = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "password", password_confirmation: "password")

        user1.save

        user2 = User.authenticate_with_credentials("     m@a.com    ", "password")
        expect(user1).to eql(user2)
      end

      it "should log in the user if authentification correct but case is sensitive" do
        user1 = User.new(first_name: "Mike", last_name: "Ackison", email: "m@a.com", password: "password", password_confirmation: "password")

        user1.save

        user2 = User.authenticate_with_credentials("m@a.COM", "password")
        expect(user1).to eql(user2)
      end
    end
  end
end
