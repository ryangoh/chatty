class AddMessageAndNameToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :message, :string
    add_column :rooms, :name, :string
  end
end
