# frozen_string_literal: true

module Mutations
  class CreatePostMutation < GraphQL::Schema::Mutation
    argument :title, String, required: true

    field :post, Types::PostType, null: true

    def resolve(title:)
      post = context[:current_user].posts.build
      post.title = title
      post.save!
      { post: post }
    rescue StandardError => ex
      GraphQL::ExecutionError.new(ex.message)
    end
  end
end
