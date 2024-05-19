class Report < ApplicationRecord
    belongs_to :user

    attribute :status, :integer, default: 0 # Ensure status attribute is defined as an integer

    enum status: { not_started: 0, ongoing: 1, completed: 2 }
  
    # Define the group attribute
    attribute :group, :string
end
