class AddDeadlineToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :deadline, :datetime
  end
end
