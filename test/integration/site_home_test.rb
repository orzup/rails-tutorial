require 'test_helper'

class SiteHomeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout stats" do
    log_in_as(@user)
    get root_path
    assert_select 'section.stats'
    assert_select 'strong#following', @user.following.count.to_s
    assert_select 'strong#followers', @user.followers.count.to_s
  end
end
