class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :status
      t.integer :user_id
      t.integer :write_id

      t.timestamps
    end
  end
end
