ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
end


class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
  end

  def setup
    user = User.create(email: "hi@hi.com", password: "hi")
    user.links.create(title: "hi", link_url: "http://www.hi.com")
  end
end
