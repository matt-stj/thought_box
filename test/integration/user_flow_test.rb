require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "full user flow" do
    visit '/'
    assert page.has_content?("Log in")
    assert page.has_content?("Sign up")

    within(".home") do
      click_link("Sign Up")
    end

    fill_in('user_email', :with => 'test@test.com')
    fill_in('user_password', :with => '12345')
    fill_in('user_password_confirmation', :with => '12345')

    click_button("Create Account")

    assert_equal(current_path, links_path)

    refute page.has_content?("google")

    fill_in('url', :with => 'http://www.google.com')
    fill_in('link_title', :with => 'google')
    click_button("Submit")

    assert page.has_content?("google")
    assert page.has_content?("http://www.google.com")
    assert page.has_content?("Mark as Read")

    click_link("Mark as Read")
    assert page.has_content?("Mark as Unread")

    click_link("Mark as Unread")
    assert page.has_content?("Mark as Read")

    click_link("Logout")

    assert_equal(current_path, '/')

    within('.nav-wrapper') do
      click_link("Log in")
    end

    fill_in('session_email', :with => 'test@test.com')
    fill_in('session_password', :with => '12345')
    click_button("Login")

    assert_equal(current_path, links_path)
  end
end
