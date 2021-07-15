class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks
    validates :title, presence: true, uniqueness: true
end
