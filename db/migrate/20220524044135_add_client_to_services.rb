class AddClientToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :client, foreign_key: true
  end
end
