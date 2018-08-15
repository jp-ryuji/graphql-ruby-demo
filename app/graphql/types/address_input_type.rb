# frozen_string_literal: true

module Types
  class AddressInputType < Types::BaseInputObject
    graphql_name 'AddressInputType'

    argument :postal_code, Integer, required: true
    argument :address, String, required: true
  end
end
