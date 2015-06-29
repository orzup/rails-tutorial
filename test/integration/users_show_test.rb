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

  test "index including activated only" do
    log_in_as(@activated)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    total_pages = assigns(:users).total_pages
    (1..total_pages).each do |i|
      get users_path, page: i
      assigns(:users).each do |user|
        assert user.activated?
      end
    end
  end
end
