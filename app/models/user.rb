class User < ActiveRecord::Base
  
  before_validation :normalize_email
  
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  
  has_secure_password
  

  def self.authenticate_with_credentials (email, password)
    email = email.strip unless email.nil?
    email = email.downcase unless email.nil?

    user = self.find_by_email(email)
 
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private
    def normalize_email 
      self.email = email.downcase
    end
end
