## Required software

* Ruby 2.5.1
* Ruby on Rails 5.2.1
* PostgreSQL 9.6 or later

## Local development
### Getting Started

1. Install packages
    ```
    $ bundle install --path vendor/bundle
    ```

2. Database setup
    ```
    $ bin/rails db:setup
    ```

3. Start local servers
    ```
    $ bin/rails server
    ```

### Alter Tables
When you change tables (e.g. add column)

1. Modify Schemafile

2. Apply
    ```
    $ bundle exec ridgepole -c config/database.yml -f db/Schemafile --apply
    ```
