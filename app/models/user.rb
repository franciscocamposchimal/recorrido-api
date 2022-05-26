# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :turns
  has_many :days_takens
end
