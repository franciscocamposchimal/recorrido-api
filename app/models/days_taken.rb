# frozen_string_literal: true

# DaysTaken Model
class DaysTaken < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :service, optional: true
  has_many :timesheets, dependent: :destroy
end
