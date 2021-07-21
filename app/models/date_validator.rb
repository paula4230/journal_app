class DateValidator < ActiveModel::Validator
    def validate(task)
    
        if task.due < Date.current
            task.errors.add :due, "Date should not be in the past"
        end 
    end
end