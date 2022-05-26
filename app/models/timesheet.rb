# frozen_string_literal: true

# Timesheet Model
class Timesheet < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :days_taken, optional: true
end
