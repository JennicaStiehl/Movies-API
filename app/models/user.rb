class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :role
  validates_presence_of :name
  validates_presence_of :active

  enum role: { admin:0, visitor: 1 }

end
