class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks
    validates :title, presence: true
    validates_uniqueness_of :title, scope: :user_id
end
