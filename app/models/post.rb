class Post < ApplicationRecord
  include BCrypt
  before_save :encrypt_id

  def encrypted_id
    encrypted_id_string || BCrypt::Password.create(id.to_s).to_s
  end

  private

  def encrypt_id
    self.encrypted_id_string = BCrypt::Password.create(id.to_s)
  end
end
