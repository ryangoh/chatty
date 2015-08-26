class AddMessageAndNameToRoom < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :message
      t.string :name

      t.timestamps null: false
    end
      # add_column :rooms, :message, :string
      # add_column :rooms, :name, :string
  end
end
