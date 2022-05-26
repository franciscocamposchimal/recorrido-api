# frozen_string_literal: true

# Service Model
class Service < ApplicationRecord
  belongs_to :client, optional: true
  has_many :days_takens, dependent: :destroy
end
