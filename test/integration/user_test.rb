require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  test "visiting the users sign in page" do
    get "/users/sign_in"  
    assert_select "h2", text: "Log in"
  end

  test "login form should be present so the user can sign in" do
    get "/users/sign_in"  
    assert_select "form"
  end

  test "email should not be empty in the login form" do
    get "/users/sign_in"
    assert_response :success 

    post "/users/sign_in",
      params: { users: {email: nil}}
      assert_response :success 
    end 



  


end
