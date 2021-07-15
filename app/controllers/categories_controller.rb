class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :is_current_user, only: %i[ show edit update destroy ]


  def index
    @categories = Category.all
  end
  
  def show
  end
  
  def new
    # @category = Category.new
    @category = current_user.categories.build
  end
  
  def edit
  end
  
  def create
    # @category = Category.new(category_params)
    @category = current_user.categories.build(category_params)
  

    if @category.save
      redirect_to categories_path, notice: "Category was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  
  def update
    if @category.update(category_params)
        redirect_to categories_path, notice: "Category was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  
  def destroy
    @category.destroy
      redirect_to categories_path, notice: "Category was successfully destroyed." 
  end
  
  private
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:title, :user_id)
  end

  def is_current_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, notice: "Not allowed to do that" if @category.nil?
  end
end
