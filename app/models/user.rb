# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one :address
end
