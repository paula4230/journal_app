require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  
  test "email should not be empty in the login form" do
    get "/users/sign_in"
    assert_response :success 

    post "/users/sign_in",
    params: { users: {email: ""}}
    assert_not_empty(:email)
  end

  test "user should be able to sign in" do
    get "/users/sign_in"  
    assert_select "form"


    post "/users/sign_in",
    params: { users: {email: 'lisa@yg.com' }}
    get user_session_path
    assert_response :success
  end

  test "user should be able to sign up" do
    get "/users/sign_up"  
    assert_select "form"

    post "/users",
    params: { users: {email: 'lisa@yg.com' }}
    assert_response :success
  end

  test "user should be able to view their categories" do
    get "/users/sign_in"  
    assert_select "form"

    post "/users",
    params: { users: {email: 'lisa@yg.com' }}
    assert_response :success

    get "/"
    assert_response :redirect
    follow_redirect!
  end






end
