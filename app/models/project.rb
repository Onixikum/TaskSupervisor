class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 4..30 }
  validates :user_id, presence: true

  default_scope -> { order(updated_at: :desc) }
end
