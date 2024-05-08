class AddUserIdToReports < ActiveRecord::Migration[7.1]
  def change
    add_reference :reports, :user, null: false, foreign_key: true
  end
end
