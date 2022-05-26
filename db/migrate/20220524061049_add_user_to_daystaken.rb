class AddUserToDaystaken < ActiveRecord::Migration[7.0]
  def change
    add_reference :days_takens, :user, foreign_key: true
  end
end
