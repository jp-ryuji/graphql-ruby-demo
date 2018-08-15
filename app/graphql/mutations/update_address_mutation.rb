# frozen_string_literal: true

# NOTE: See the following
#   https://github.com/rmosolgo/graphql-ruby/blob/master/guides/mutations/mutation_classes.md
#   http://graphql-ruby.org/api-doc/1.8.6/GraphQL/Schema/Mutation
module Mutations
  class UpdateAddressMutation < Mutations::BaseMutation
    argument :postal_code, Integer, required: true
    argument :address, String, required: true

    field :address, Types::AddressType, null: true
    field :errors, [String], null: false

    def resolve(postal_code:, address:)
      user = context[:current_user]
      user_address = user.address
      user_address.postal_code = postal_code
      user_address.address = address

      if user_address.save
        {
          address: user_address,
          errors: []
        }
      else
        {
          address: nil,
          errors: user_address.errors.full_messages
        }
      end
    end
  end
end
