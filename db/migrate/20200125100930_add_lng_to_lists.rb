class AddLngToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :lng, :float
  end
end
