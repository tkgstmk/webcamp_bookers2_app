class AddColumnTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :user, :integer
    add_column :books, :user_id, :integer
  end
end
