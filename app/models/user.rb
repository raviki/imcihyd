class User < ActiveRecord::Base
  require 'bcrypt'
  attr_accessor :password
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true #password_confirmation attr
  before_save :encrypt_password
  after_save :clear_password
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end
  
  def new_remember_token
    @token = SecureRandom.urlsafe_base64
    return @token
    
  end
  
  def encrypt_token(token)
    return Digest::SHA1.hexdigest(token.to_s)
  end  
end
