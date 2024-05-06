class AddMembersOnDutyToReports < ActiveRecord::Migration[7.1]
  def change
    add_column :reports, :members_on_duty, :string
  end
end
