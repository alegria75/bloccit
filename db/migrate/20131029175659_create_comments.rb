class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post
      t.integer :user_id


      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
