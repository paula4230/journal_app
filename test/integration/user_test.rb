require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  test "visiting the users sign in page" do
    get "/users/sign_in"  
    assert_select "h2", text: "Log in"
  end

  


end
