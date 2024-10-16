class AddEncryptedIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :encrypyed_id_string, :string
  end
end
