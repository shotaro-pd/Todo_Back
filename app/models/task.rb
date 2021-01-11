class Task < ApplicationRecord
    validates :text, presence: true
    validates :tag, presence: true
end
