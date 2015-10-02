class CreateContacts < ActiveRecord::Migration
  def down
    drop_table :contacts
  end
end