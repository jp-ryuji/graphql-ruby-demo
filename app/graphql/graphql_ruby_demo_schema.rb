# frozen_string_literal: true

class GraphqlRubyDemoSchema < GraphQL::Schema
  query Types::QueryType
  mutation Types::MutationType
end