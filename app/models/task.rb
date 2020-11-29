class Task < ApplicationRecord
  belongs_to :note
  validates :title, :note, presence: true
end
