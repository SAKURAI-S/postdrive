class AddLatToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :lat, :float
  end
end
