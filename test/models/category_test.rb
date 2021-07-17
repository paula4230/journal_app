require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    users(:lisa).password = 'string'
  end

  test 'should not save Category without title' do
    category = Category.new(user: users(:lisa))
    assert_not category.save
  end

  test 'should not save category if the title has already been taken' do
    category1 = Category.new(title:"work", user: users(:lisa))
    category2 = Category.new(title:"work", user: users(:lisa))

    if category1 == category2
      assert_not category2.save 
    end     
  end
end



