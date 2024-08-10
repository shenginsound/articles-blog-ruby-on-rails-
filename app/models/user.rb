class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles
    validates :user_name, 
        uniqueness: { case_sensitive: false }, 
        presence: true, length: {minimum: 3, maximum: 30}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
    validates :email, presence: true,  
    uniqueness: { case_sensitive: false }, 
    length: {maximum: 30}, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end