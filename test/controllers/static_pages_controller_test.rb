require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Ruby on Rails Tutorial のサンプルアプリ"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "ホーム | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "サンプルアプリについて | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select 'title', "お問合せ | #{@base_title}"
  end
end
