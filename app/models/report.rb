class Report < ApplicationRecord
  belongs_to :user

  # Define attributes using the attribute method
  attribute :status, :integer
  attribute :group, :string
  attribute :attendance, :integer

  # Define enum with descriptive names
  enum status: { ongoing: 0, completed: 1, not_started: 2 }

  # Validation for presence and inclusion of status
  validates :status, presence: true, inclusion: { in: statuses.keys }

  # Validation for presence of group and attendance attributes if needed
  validates :group, presence: true
  validates :attendance, presence: true

end
