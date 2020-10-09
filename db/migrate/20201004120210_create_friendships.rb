class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, references: :users, foreign_key: { to_table: :users} # Friend has no table so to 'exist' as a class we use the user table to create the 'friends' class
      t.timestamps
    end
  end
end
