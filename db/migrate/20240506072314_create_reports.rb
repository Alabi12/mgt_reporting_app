class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.datetime :date
      t.text :observation
      t.integer :risk_level
      t.text :recommendation
      t.text :action_plan
      t.text :timelines

      t.timestamps
    end
  end
end
