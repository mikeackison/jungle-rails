class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, :last_name, presence: true
end
