class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true

  validates :password, presence: true
  validates_confirmation_of :password



end
