class AddStatusToReports < ActiveRecord::Migration[7.1]
  def change
    # add_column :reports, :status, :string
    add_column :reports, :status, :integer
  end
end
