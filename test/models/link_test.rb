require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:link_url)

  should_not allow_value("blah").for(:link_url)
  should allow_value("http://www.blah.com").for(:link_url)

end
