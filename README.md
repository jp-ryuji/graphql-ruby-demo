# References

- [GraphQL official page](https://graphql.org/)
- [How to GraphQL](https://www.howtographql.com/) - The Fullstack Tutorial for GraphQL (This page is the most informative)
  - [graphql-ruby Tutorial](https://www.howtographql.com/graphql-ruby/0-introduction/)
- [GraphQL Ruby](http://graphql-ruby.org/)

# Notes

## [Who's using GraphQL?](http://graphql.github.io/users/)

Facebook, Github, Shopify and many other organizations are using it.
It's developed by Facebook.

## GraphQL or REST?

There are `Queries` and `Mutations`.
As for CRUD, `Queries` are for R (Read) and `Mutations` are for the rest.
You can use GraphQL along with REST. For instance, R is done by GraphQL and CUD is done by REST.

## Some characteristics of GraphQL

- GraphQL APIs get all the data your app needs in a single request.
- Access the full capabilities of your data from a single endpoint.
- GraphQL comes with a powerful query editor: GraphiQL
- [Avoid versioning](http://graphql.github.io/learn/best-practices/#versioning). It's not prohibited, though.
- Always use `POST`.
- Always return 200. The `errors` field exists when there are errors.

## Relay and Non-Relay implementation in graphql-ruby

Bear in mind that there are Relay and Non-Relay implementations.
For instance, connection is for relay (that comes with `edges` and `node`. See [here](https://building.buildkite.com/tutorial-getting-started-with-graphql-queries-and-mutations-11211dfe5d64). The `edges` and `node` fields help to provide pagination and count.).

- [https://github.com/rmosolgo/graphql-ruby/blob/master/guides/relay/connections.md](https://github.com/rmosolgo/graphql-ruby/blob/master/guides/relay/connections.md)

## [The APIs were changed to class-based style in GraphQL 1.8](http://graphql-ruby.org/schema/class_based_api.html)

In GraphQL 1.8+, you can use Ruby classes to build your schema. You can mix class-style and .define-style type definitions in a schema.

# Required software for this repository

- Ruby 3.2.9
- Ruby on Rails 8.0.2.1
- PostgreSQL 17 or later

# Local development

## Getting Started

1. Install packages

    ```bash
    bundle install --path vendor/bundle
    ```

2. Database setup

    ```bash
    bin/rails db:setup
    ```

3. Start local servers

    ```bash
    bin/rails server
    ```

## Database seeding (sample data)

```bash
bin/rails db:seed_fu
```

## Alter Tables

When you change tables (e.g. add column)

1. Modify Schemafile

2. Apply

    ```bash
    bundle exec ridgepole -c config/database.yml -f db/Schemafile --apply
    ```

# Queries and Mutations

- See: [https://graphql.org/learn/queries/](https://graphql.org/learn/queries/)
- You can use GraphiQL at [http://localhost:3000/graphiql](http://localhost:3000/graphiql) on the development environment.

## Queries (on GraphiQL)

```graphql
query Ping {
  ping
}

# response
{
  "data": {
    "ping": "Hello World"
  }
}
```

```graphql
query User($id: ID = "") {
  user(id: $id) {
    email
    address {
      address
      postalCode
    }
    posts {
      title
    }
  }
}

# Query Variables
{ "id": "1" }

# Response
{
  "data": {
    "user": {
      "email": "one@example.com",
      "address": {
        "address": "Somewhere around the world",
        "postalCode": 1234567
      },
      "posts": [
        {
          "title": "ggrks"
        },
        {
          "title": "yagni"
        },
        {
          "title": "ggrks"
        },
        {
          "title": "yagni"
        }
      ]
    }
  }
}
```

```bash
# With curl
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/graphql" -d 'query Ping { ping }'
```

```graphql
query User($email: String!) {
  users(email: $email) {
    id
    email
    address {
      address
      postalCode
    }
  }
}

# Query Variables
{ "email": "one@example.com" }

# Response
{
  "data": {
    "users": [
      {
        "id": "1",
        "email": "one@example.com",
        "address": {
          "address": "Somewhere around the world",
          "postalCode": 1234567
        }
      }
    ]
  }
}
```

```bash
# With curl
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/graphql" -d 'query User($email: String!) { users(email: $email) { id email address { address postalCode } } }' -H "Content-Type: application/json" -d '{"query": "query User($email: String!) { users(email: $email) { id email address { address postalCode } } }", "variables": {"email": "one@example.com"}}'
```

```graphql
query Address($prefecture: String, $ward: String) {
  addresses(prefecture: $prefecture, ward: $ward) {
    postalCode
    address
  }
}

# Query Variables
{ "prefecture": "Somewhere", "ward": "world" }

# Response
{
  "data": {
    "addresses": [
      {
        "postalCode": 1234567,
        "address": "Somewhere around the world"
      }
    ]
  }
}
```

## Mutations (on GraphiQL)

### GraphQL-Ruby includes two classes to help you write mutations

[http://graphql-ruby.org/mutations/mutation_classes](http://graphql-ruby.org/mutations/mutation_classes)

- GraphQL::Schema::Mutation, a bare-bones base class
- GraphQL::Schema::RelayClassicMutation, a base class with a set of nice conventions that also supports the Relay Classic mutation specification.

```bash
mutation {
  updateAddress(postalCode: 98765, address: "New address in the new country") {
    address {
      id
      postalCode
      address
    }
    errors {
      path
      message
    }
  }
}

# Response
{
  "data": {
    "updateAddress": {
      "address": {
        "id": "1",
        "postalCode": 98765,
        "address": "New address in the new country"
      },
      "errors": []
    }
  }
}
```

```bash
# With curl
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/graphql" -d 'mutation { updateAddress(postalCode: 98765, address: "New address in the new country") { address { id postalCode address } errors { path message } } }'
```

```bash
mutation {
  createPost(title: "You could be mine") {
    post {
      title
      user {
        email
      }
    }
  }
}

# Response
{
  "data": {
    "createPost": {
      "post": {
        "title": "You could be mine",
        "user": {
          "email": "one@example.com"
        }
      }
    }
  }
}
```

```bash
# With curl
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/graphql" -d 'mutation { createPost(title: "You could be mine") { post { title user { email } } } }'
```

```bash
mutation {
  createUser(attributes: { email: "new@example.com", address: { postalCode: 123456789, address: "Brand New Address" }}) {
    user {
      id
      email
      address {
        postalCode
        address
      }
    }
  }
}

# Response
{
  "data": {
    "createUser": {
      "user": {
        "id": "4",
        "email": "new@example.com",
        "address": {
          "postalCode": 123456789,
          "address": "Brand New Address"
        }
      }
    }
  }
}
```

```bash
# With curl
curl -X POST http://localhost:3000/graphql -H "Content-Type: application/graphql" -d 'mutation { createUser(attributes: { email: "new@example.com", address: { postalCode: 123456789, address: "Brand New Address" }}) { user { id email address { postalCode address } } } }'
```
