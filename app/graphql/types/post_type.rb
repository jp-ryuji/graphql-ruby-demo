# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    graphql_name 'Post'

    field :id, ID, null: false
    field :title, String, null: false
    field :user, Types::UserType, null: false
  end
end
