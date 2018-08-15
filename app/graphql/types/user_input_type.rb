# frozen_string_literal: true

module Types
  class UserInputType < Types::BaseInputObject
    graphql_name 'UserInputType'

    argument :email, String, required: true
    argument :address, Types::AddressInputType, required: false
  end
end
