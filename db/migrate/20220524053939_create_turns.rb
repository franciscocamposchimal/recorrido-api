class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.references :days_taken, foreign_key: true
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
