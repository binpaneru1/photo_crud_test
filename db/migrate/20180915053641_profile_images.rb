class ProfileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_images do |t|
      t.string :avatar
      t.integer  :active
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
