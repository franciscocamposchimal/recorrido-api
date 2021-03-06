# frozen_string_literal: true

require 'jwt'

# Module for encode and decode token
module JsonWebToken
  extended ActiveSupport::Concern

  SECRET_KEY = Rails.application.secrets.secret_key_base

  def jwt_encode(payload, exp = 1.day.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
