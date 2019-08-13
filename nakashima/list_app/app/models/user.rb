class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #正規表現でemailを検証する
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #emailの大文字小文字を区別しない
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
