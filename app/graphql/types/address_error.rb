# frozen_string_literal: true

module Types
  # NOTE: http://graphql-ruby.org/mutations/mutation_errors.html#errors-as-data
  class AddressError < Types::BaseObject
    description 'Description comes here'

    field :message, String, null: false, description: 'A description of the error'
    field :path, [String], null: true, description: 'Which input value this error came from'
  end
end
