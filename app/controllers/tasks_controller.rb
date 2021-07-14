class TasksController < ApplicationController
    before_action :get_category
    def index
        @tasks = @category.tasks
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


    def update
        @task = @category.task.update(task_params)
        
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
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:title, :details, :due)
    end
end
