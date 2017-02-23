class CreateWrites < ActiveRecord::Migration[5.0]
  def change
    create_table :writes do |t|
      t.string :title
      t.text :post
      t.boolean :publish
      t.integer :user_id

      t.timestamps
    end
  end
end
