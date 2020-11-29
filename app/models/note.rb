class Note < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  scope :user_notes, ->(user) { where(['user_id = ?', user.id]) }
end
