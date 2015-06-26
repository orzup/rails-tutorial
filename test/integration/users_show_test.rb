require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @activated = users(:michael)
    @non_activated = users(:newuser)
  end

  test "show as activated user" do
    log_in_as(@activated)
    get user_path(@activated)
    assert_template 'users/show'
  end

  test "show as non-activated user" do
    get user_path(@non_activated)
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'static_pages/home'
  end
end
