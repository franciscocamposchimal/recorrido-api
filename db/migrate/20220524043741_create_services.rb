class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
