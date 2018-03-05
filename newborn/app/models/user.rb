class User < ApplicationRecord
  has_secure_password

  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates_length_of :password, :minimum => 6, :on => :create
end
