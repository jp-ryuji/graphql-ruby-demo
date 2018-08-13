# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :post, inverse_of: :comments
end
