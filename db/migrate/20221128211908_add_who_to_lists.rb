class AddWhoToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :who, :string
  end
end
