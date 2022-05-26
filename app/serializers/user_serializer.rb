# frozen_string_literal: true

# Model user serializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email
end
