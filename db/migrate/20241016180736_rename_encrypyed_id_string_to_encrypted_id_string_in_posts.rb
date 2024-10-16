class RenameEncrypyedIdStringToEncryptedIdStringInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :encrypyed_id_string, :encrypted_id_string
  end
end
