class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    # before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :is_current_user, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = @category.tasks
    end

    def urgent
        @urgent_tasks = tasks.where(due:Date.today)
    end

    
    def new
        @task = @category.tasks.build
    end

    def show
    end

    def create
        @task = @category.tasks.build(task_params)
        if @task.save
            redirect_to category_tasks_path, notice: "Task was successfully created." 
        else
            render :new
        end
    end
    
    def edit
    end

    def update
        if @task.update(task_params)
                redirect_to category_tasks_path, notice: "Task was successfully updated." 
            else
              render :edit
        end
        
    end

    def destroy
        @task.destroy
        redirect_to category_tasks_path, notice: "Task was successfully destroyed." 
    end


    private

    def get_category
        @category = current_user.categories.find(params[:category_id])
        redirect_to categories_path, notice: "Not allowed to do that" if @category.nil?
    end

    def is_current_user
        @task = @category.tasks.find(params[:id])
        redirect_to categories_path, notice: "Not allowed to do that" if @task.nil?
    end

    # def set_task
    #     @task = @category.tasks.find(params[:id])
    # end

    def task_params
        params.require(:task).permit(:title, :details, :due, :user_id)
    end
end
