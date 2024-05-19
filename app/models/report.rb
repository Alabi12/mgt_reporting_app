class Report < ApplicationRecord
    belongs_to :user

    enum status: { ongoing: 0, completed: 1, not_started: 2 }

  validates :status, presence: true # Validate presence of status
end
