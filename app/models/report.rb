class Report < ApplicationRecord
    belongs_to :user

    enum status: { not_started: 0, ongoing: 1, completed: 2 }

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :not_started
  end
end
