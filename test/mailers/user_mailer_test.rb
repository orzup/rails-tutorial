require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "アカウント仮登録のご連絡", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name, mail.text_part.body.to_s
    assert_match user.activation_token, mail.text_part.body.to_s
    assert_match CGI::escape(user.email), mail.text_part.body.to_s
    assert_match user.name, mail.html_part.body.to_s
    assert_match user.activation_token, mail.html_part.body.to_s
    assert_match CGI::escape(user.email), mail.html_part.body.to_s
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "パスワード再発行のご連絡", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name, mail.text_part.body.to_s
    assert_match user.reset_token, mail.text_part.body.to_s
    assert_match CGI::escape(user.email), mail.text_part.body.to_s
    assert_match user.name, mail.html_part.body.to_s
    assert_match user.reset_token, mail.html_part.body.to_s
    assert_match CGI::escape(user.email), mail.html_part.body.to_s
  end
end
