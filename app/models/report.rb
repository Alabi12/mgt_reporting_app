class Report < ApplicationRecord
  belongs_to :user

  # Define enum with more descriptive names to avoid conflicts
  enum status: { ongoing: 0, completed: 1, not_started_report: 2 }

  validates :status, presence: true
  
end

