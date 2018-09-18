class AddAttachmentUserToProfileImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :profile_images do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :profile_images, :profile_image
  end
end
