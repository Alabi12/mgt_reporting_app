class AddGroupAndAttendanceToReports < ActiveRecord::Migration[7.1]
  def change
    add_column :reports, :group, :string
    add_column :reports, :attendance, :integer
  end
end
