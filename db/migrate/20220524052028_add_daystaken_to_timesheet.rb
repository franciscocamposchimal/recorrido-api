class AddDaystakenToTimesheet < ActiveRecord::Migration[7.0]
  def change
    add_reference :timesheets, :days_taken, foreign_key: true
  end
end
