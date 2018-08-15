# frozen_string_literal: true

# NOTE: See the following
#   https://github.com/rmosolgo/graphql-ruby/blob/master/guides/mutations/mutation_classes.md
#   http://graphql-ruby.org/api-doc/1.8.6/GraphQL/Schema/Mutation
module Mutations
  class UpdateAddressMutation < Mutations::BaseMutation
    argument :postal_code, Integer, required: true
    argument :address, String, required: true

    # NOTE: Return values via fields.
    field :address, Types::AddressType, null: true
    field :errors, [Types::AddressError], null: false

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
          errors: address_errors(user_address)
        }
      end
    end

    private

    # NOTE: http://graphql-ruby.org/mutations/mutation_errors.html#errors-as-data
    def address_errors(user_address)
      # Convert Rails model errors into GraphQL-ready error hashes
      user_address.errors.map do |attribute, message|
        {
          # This is the GraphQL argument which corresponds to the validation error
          path: ['attributes', attribute.camelize],
          message: message
        }
      end
    end
  end
end
