# frozen_string_literal: true

# Client Model
class Client < ApplicationRecord
  has_many :services, dependent: :destroy
end
