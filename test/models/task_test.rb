require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    users(:lisa).password = 'string'
  end

  test 'should not save Task without title' do
    task = Task.new(category: categories(:work), user: users(:lisa))
    assert_not task.save, "saved task without title"
  end

  test 'should not save task if the title under the same category has already been taken' do

    task1 = Task.new(title: "testing", category: categories(:work), user: users(:lisa))
    task1.save
    task2 = Task.new(title: "testing", category: categories(:work), user: users(:lisa))

      if task1.valid?
        assert_not task2.save
      end   
  end

  test "due date should not be less than the date today" do
    task = Task.new(title: "testing", due: Date.new(2021, 7, 16), category: categories(:work), user: users(:lisa))  

    assert_not task.save
  end

end
