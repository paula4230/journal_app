class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks
    validates :title, presence: true
end
