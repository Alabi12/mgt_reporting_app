class Report < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
  # Define enum with more descriptive names to avoid conflicts
  enum status: { ongoing: 0, completed: 1, not_started_report: 2 }

  validates :status, presence: true
=======

    enum status: { ongoing: 0, completed: 1, not_started: 2 }

  validates :status, presence: true # Validate presence of status

    attribute :status, :integer, default: 0 # Ensure status attribute is defined as an integer

    enum status: { not_started: 0, ongoing: 1, completed: 2 }
  
    # Define the group attribute
    attribute :group, :string
    # Define the attendance attribute
    attribute :attendance, :integer

>>>>>>> 703b1217513df668fdaba57d1e8362470699a940
end

