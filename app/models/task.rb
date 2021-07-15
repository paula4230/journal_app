class Task < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :title, presence: true, uniqueness: true
end
