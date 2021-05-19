# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Core libraries
gem 'rails', '~> 6.0.0.rc1'

# Database, ORM, Model, etc
gem 'activerecord-import'
gem 'sqlite3', '~> 1.4' # Use sqlite3 as the database for Active Record

# Web servers
gem 'puma', '~> 4.3' # Use Puma as the app server

# Views
gem 'sass-rails', '~> 5' # Use SCSS for stylesheets
gem 'slim-rails'
gem 'webpacker', '~> 4.0' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# API
gem 'active_model_serializers', '~> 0.10.0'
# Use Redis adapter to run Action Cable in production

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Rack Middlewares

# Deployment

# Jobs, Cron
gem 'whenever', require: false

# Authentication and Authorization

# SEO

# Others
gem 'config'
gem 'fastimage'
gem 'mini_magick'
gem 'rails-patterns'
gem 'ruby-readability', require: 'readability'

group :development, :test do
  gem 'brakeman'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rubocop', require: false # RuboCop is a Ruby static code analyzer and code formatter.
  gem 'rubocop-performance'
end

group :development do
  gem 'hirb'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Spring speeds up development by keeping your application running in the background
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'faker'
  # Adds support for Capybara system testing and selenium driver1
  gem 'capybara', '>= 2.15'
  gem 'rspec_junit_formatter'
  gem 'rubocop-junit-formatter', require: false
  gem 'rubocop-rspec'
  gem 'selenium-webdriver'
  gem 'test-prof'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
