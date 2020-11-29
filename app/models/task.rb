class Task < ApplicationRecord
  belongs_to :note
  validates :title, :note, presence: true

  scope :user_tasks, ->(user) {joins(:note).where(['user_id = ?', user.id])}
end
