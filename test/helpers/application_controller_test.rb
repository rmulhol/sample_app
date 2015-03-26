require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "should provide proper full title for home page" do
    assert_equal "Ruby on Rails Tutorial Sample App", full_title
  end

  test "should provide proper full title for other pages" do
    assert_equal "Sign Up | Ruby on Rails Tutorial Sample App", full_title("Sign Up")
  end
end
