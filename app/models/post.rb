class Post < ApplicationRecord
  require 'bcrypt'

  after_create :encrypt_id

  private

  def encrypt_id
    update_column(:encrypted_id_string, BCrypt::Password.create(self.id.to_s))
  end
end
