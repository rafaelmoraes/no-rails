# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.1'

gem 'dry-system'

gem 'dry-monads', '~> 1.3'
gem 'dry-validation', '~> 1.5'

gem 'pg'
gem 'rom'
gem 'rom-sql'

gem 'dotenv'
gem 'rake'

# View
gem 'hanami-controller', '~> 1.3'

gem 'hanami-router', '~> 1.3'

group :test, :development do
  gem 'amazing_print'
  gem 'pry'
  gem 'pry-byebug'

  gem 'rubocop'

  gem 'puma'
end

group :test do
  gem 'simplecov'

  gem 'database_cleaner-sequel'
  gem 'rspec'

  # View
  gem 'rack-test'
end
