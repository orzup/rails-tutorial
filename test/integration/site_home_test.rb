require 'test_helper'

class SiteHomeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout stuts" do
    log_in_as(@user)
    get root_path
    assert_match @user.following.count.to_s, response.body
    assert_match @user.followers.count.to_s, response.body
  end
end
