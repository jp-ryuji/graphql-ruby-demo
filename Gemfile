# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.9'

gem 'rails', '8.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 7.0'
gem 'sass-rails', '~> 6.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'ridgepole'
gem 'graphql'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'rubocop', require: false
  gem 'overcommit', require: false
  gem 'bullet'
  gem 'rails-erd'
  gem 'seed-fu'
  gem 'graphiql-rails'
end
