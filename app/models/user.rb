class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)

    if (user && user.authenticate(password))
      user
    else
      nil
    end
  end
end
