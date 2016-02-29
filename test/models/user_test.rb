require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
  should_not allow_value("blah").for(:email)
  should allow_value("matt@matt.com").for(:email)

  should validate_presence_of(:password)
  should validate_confirmation_of(:password)
  should have_secure_password

  should have_many(:links)
end
