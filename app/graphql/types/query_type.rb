# frozen_string_literal: true

module Types
  class QueryType < GraphQL::Schema::Object
    include ActiveRecord::Sanitization::ClassMethods

    field :ping, String, 'Description comes here', null: false

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    field :users, Types::UserType, null: false do
      argument :email, String, required: true
    end

    field :addresses, [Types::AddressType], null: false do
      argument :prefecture, String, required: false
      argument :ward, String, required: false
    end

    def ping
      'Hello World'
    end

    def user(id:)
      User.find(id)
    end

    def users(email:)
      User.find_by(email: email)
    end

    # NOTE: The logic is for the demo. So don't take it seriously.
    def addresses(prefecture:, ward:)
      query = Address.all
      query = query.where('addresses.address like :prefecture', prefecture: "%#{prefecture}%") if prefecture.present?
      query = query.where('addresses.address like :ward', ward: "%#{ward}%") if ward.present?
      query.order(created_at: :desc)
    end
  end
end
