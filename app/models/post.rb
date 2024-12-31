class Post < ApplicationRecord
  require 'bcrypt'
  after_create :encrypt_id
  
  def to_param
    encrypted_id_string
  end

  private

  def encrypt_id
    update_column(:encrypted_id_string, BCrypt::Password.create(self.id.to_s))
  end
end
