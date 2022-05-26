class CreateDaysTakens < ActiveRecord::Migration[7.0]
  def change
    create_table :days_takens do |t|
      t.date :day
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
