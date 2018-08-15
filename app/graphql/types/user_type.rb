# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    graphql_name 'User'

    field :id, ID, null: false
    field :email, String, null: false
    field :address, Types::AddressType, null: true
    field :posts, [Types::PostType], null: true
    # NOTE: Relay expresses one-to-many relationships with connections.
    #   See: https://github.com/rmosolgo/graphql-ruby/blob/master/guides/relay/connections.md
    # field :posts, Types::PostType.connection_type, null: true
  end
end
