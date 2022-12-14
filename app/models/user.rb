# NOTE: User DB fields
# email:string
# password_digest:string
#
# Note: User virtual attributes to create the password, not stored in the DB
# Note: This virtual attributes will help us to create the password
# password:string - virtual attribute
# password_confirmation:string - virtual attribute

class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX, message: 'must be a valid email address' }
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
end
