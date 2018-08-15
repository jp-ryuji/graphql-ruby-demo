# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_address, mutation: Mutations::UpdateAddressMutation
    field :create_post, mutation: Mutations::CreatePostMutation
  end
end
