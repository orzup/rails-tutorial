require 'test_helper'

class SiteHomeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "show feeds" do
    log_in_as(@user)
    get root_path
    total_pages = assigns(:feed_items).total_pages
    (1..total_pages).each do |i|
      get root_path, page: i
      assigns(:feed_items).each do |feed_item|
        assert (@user == feed_item.user || @user.following.include?(feed_item.user))
      end
    end
  end
end
