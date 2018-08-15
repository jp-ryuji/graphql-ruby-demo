# frozen_string_literal: true

module Types
  class AddressType < Types::BaseObject
    graphql_name 'Address'

    field :id, ID, null: false
    field :postal_code, Integer, null: false
    field :address, String, null: false
  end
end

# NOTE: The following is old implementation before v1.8.0. Then, use `postal_code` intead of `postalCode` in queries.
# Types::AddressType = GraphQL::ObjectType.define do
#   name 'Address'
#
#   field :id, !types.ID
#   field :postal_code, !types.Int
#   field :address, !types.String
# end
