class CreateTimesheets < ActiveRecord::Migration[7.0]
  def change
    create_table :timesheets do |t|
      t.time :hour
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
