require 'digest/sha2'
class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password

  has_and_belongs_to_many :jobs
  has_many :reviews

  validate :password_must_be_present
  
  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "lulz" + salt)
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private
    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
