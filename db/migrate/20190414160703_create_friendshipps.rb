class CreateFriendshipps < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true

      t.references :friend, foreign_key: false
      # OR
      # t.integer :friend_id, index: true #=> Alternative to above line

      t.string :status
      t.boolean :accepted, default: false


      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
