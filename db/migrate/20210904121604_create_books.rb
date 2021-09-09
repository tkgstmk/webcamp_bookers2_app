class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.timestamps
      t.string :title
      t.text :body
      t.integer :user
    end
  end
end
