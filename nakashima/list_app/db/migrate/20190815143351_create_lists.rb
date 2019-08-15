class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :lists, [:user_id, :created_at]
  end
end
