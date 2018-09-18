class FriendRequest < ActiveRecord::Migration[5.2]
  def change
   create_table :friend_requests do |t|
     t.references :user, foreign_key: true
     t.references :friend, index: true, foreign_key: {to_table: :users}
     t.integer  :status
     t.timestamps
   end
 end
end
