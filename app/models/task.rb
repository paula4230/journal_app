class Task < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :title, presence: true
    validates_uniqueness_of :title, scope: :category_id

    include ActiveModel::Validations
    validates_with DateValidator

    

end


