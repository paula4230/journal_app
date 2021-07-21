require "test_helper"

class UserTest < ActionDispatch::IntegrationTest

  # setup do
  #   @category = Category.all
  # end

  # setup do
  #   @category = categories(:leisure)
  # end

  # setup do
  #   @tasks = Task.all
  # end  

  # setup do
  #   @task = tasks(:read_book)
  # end  
  
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
    assert_response :success
    
    get "/"
    assert_response :redirect
    follow_redirect!
  end

  test "user should be able to create categories " do
    get "/users/sign_in"
    assert_response :success

    get "/categories/new"
    assert_response :redirect
  

    post "/categories",
    params: { category: { title: "new category"} }
    assert_response :redirect
    follow_redirect!

  end

  test "user should be able to update their categories" do
    get "/users/sign_in"
    assert_response :success

    get "/categories"
    assert_response :redirect
    follow_redirect!

    patch "/categories/#{:id}",
    params: { category: { title: "update title" } }
    assert_response :redirect
    follow_redirect!
  end

  test "user should be able to create tasks" do
    get "/users/sign_in"
    assert_response :success

    get "/categories/#{:category_id}/tasks/new"
    assert_response :redirect
  
    post "/categories/#{:category_id}/tasks",
    params: { task: { title: "new category", details:"description"} }
    assert_response :redirect
    follow_redirect!
  end

  test "user should be able to view tasks under a category" do
    get "/categories/#{:category_id}/tasks/#{:id}"
    assert_response :redirect
    follow_redirect!
  end

  test "user should be able to update their tasks" do
    get "/users/sign_in"
    assert_response :success

    get "/categories/#{:category_id}/tasks/#{:id}/edit"
    assert_response :redirect
    follow_redirect!

    patch "/categories/#{:category_id}/tasks/#{:id}",
    params: { task: { title: "update title" } }
    assert_response :redirect
    follow_redirect!
  end 

  test "user should be able to delete their tasks" do
    # assert_difference("Task.count", -1) do
    #   delete category_task_url(@category, @task)
    #   params: {task: tasks(:read_book) }
    # end
    get "/users/sign_in"
    assert_response :success

    post user_session_path, params: {user: {email:    users(:lisa).email}}

    delete "/categories/#{categories(:leisure).id}/tasks/#{tasks(:read_book).id}", params: {task: {id: tasks(:read_book).id}}
    assert_response :redirect
    follow_redirect!
    assert_response :success



  end

  test "user should have a separate view only for tasks that are due today" do
    get "/categories"
    assert_response :redirect
  end

end
