class TasksController < ApplicationController

    before_action :get_category
    def index
        @tasks = @category.tasks
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)

        respond_to do |format|
            if @task.save
              format.html { redirect_to category_tasks_path, notice: "Task was successfully created." }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
          end
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:title, :details)
    end
end
