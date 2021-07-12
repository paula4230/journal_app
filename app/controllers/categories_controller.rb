class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @categories = Category.all
    end
  
    def show
    end
  
    def new
      @category = Category.new
    end
  
    def edit
    end
  
    def create
      @category = Category.new(category_params)
  
      respond_to do |format|
        if @category.save
          redirect_to @category, notice: "Category was successfully created." 
        else
            render :new, status: :unprocessable_entity 
        end
      end
    end
  
    def update
      respond_to do |format|
        if @category.update(category_params)
            redirect_to @category, notice: "Category was successfully updated." 
        else
          render :edit, status: :unprocessable_entity 
        end
      end
    end
  
    def destroy
      @category.destroy
      respond_to do |format|
        redirect_to categories_url, notice: "Category was successfully destroyed." 
      end
    end
  
    private
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title, :body)
    end
end
