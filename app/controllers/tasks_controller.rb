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
              render :new, status: :unprocessable_entity 
            end
          end


    def update
        if @category.task.update(task_params)
        end
        
    end


    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:title, :details, :due)
    end
end
