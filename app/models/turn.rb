# frozen_string_literal: true

# Turn Model
class Turn < ApplicationRecord
  belongs_to :days_taken
  belongs_to :user
  belongs_to :service
end
