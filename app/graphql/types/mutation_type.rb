# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_address, mutation: Mutations::UpdateAddressMutation
    field :create_post, mutation: Mutations::CreatePostMutation
    field :create_user, mutation: Mutations::CreateUserMutation do
      # NOTE: See: http://graphql-ruby.org/type_definitions/input_objects.html
      # NOTE: The following can exist in Mutations::CreateUserMutation
      argument :attributes, Types::UserInputType, required: true
    end
  end
end
