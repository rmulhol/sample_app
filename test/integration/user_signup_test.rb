require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup path" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, user: { name:                  "",
                               email:                 "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template "users/new"
  end

  test "valid signup path" do
    get signup_path
    assert_difference "User.count", 1 do
      post_via_redirect users_path, user: { name:                  "Michael Hartl",
                                            email:                 "mhartl@example.org",
                                            password:              "foobar",
                                            password_confirmation: "foobar" }
    end
    assert_template "users/show"
    assert is_logged_in?
  end
end
