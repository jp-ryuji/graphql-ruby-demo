# frozen_string_literal: true

module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    # argument :attributes, Types::UserInputType, required: true

    field :user, Types::UserType, null: true

    def resolve(attributes:)
      user = User.new(email: attributes.email)

      address = attributes.address
      if address.present? && address.postal_code.present? && address.address.present?
        user.build_address(postal_code: address.postal_code, address: address.address)
      end

      user.save!

      { user: user }
    rescue StandardError => ex
      GraphQL::ExecutionError.new(ex.message)
    end
  end
end
