require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is not valid without matching password and password_confirmation' do
      user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'jane@example.com',
        password: 'password',
        password_confirmation: 'mismatch'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without required fields' do
      user = User.new
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Email can't be blank", "Password can't be blank")
    end

    it 'is not valid with a non-unique email (case-insensitive)' do
      existing_user = User.create(
        first_name: 'Existing',
        last_name: 'User',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        first_name: 'New',
        last_name: 'User',
        email: 'TEST@example.com', # Uppercase email
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    

    it 'is not valid with a short password' do
      user = User.new(
        first_name: 'Short',
        last_name: 'Password',
        email: 'short@example.com',
        password: 'short',
        password_confirmation: 'short'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns user instance if authenticated' do
      user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'returns nil if not authenticated' do
      user = User.create(
        first_name: 'Jane',
        last_name: 'Smith',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end

    it 'ignores leading and trailing spaces in email' do
      user = User.create(
        first_name: 'Sam',
        last_name: 'Johnson',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'ignores case sensitivity in email' do
      user = User.create(
        first_name: 'Alex',
        last_name: 'Wilson',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('TEST@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end
