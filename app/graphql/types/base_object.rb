# frozen_string_literal: true

module Types
  # NOTE: It's recommended to create a base class for your application, then extend the base class for each of your types
  #   See: http://graphql-ruby.org/schema/class_based_api.html#customizing-defintions
  class BaseObject < GraphQL::Schema::Object
  end
end
