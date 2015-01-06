# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  # sets the e-mail to lower case
  before_save { email.downcase! }
  # makes sure the name is not blank and is not over 50 characters
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # http://www.rubular.com/ OFFICIAL EMAIL ADDRESS REGEX --> /([\w+.]+)@[a-z0-9\-.]+\.[a-z]+/i
  validates :email, presence: true, 
    format: { with: VALID_EMAIL_REGEX }, 
  	uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
