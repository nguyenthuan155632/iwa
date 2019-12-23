# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Iwa
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # load_path for calculations classes
    config.autoload_paths += Dir[Rails.root.join('app', 'services', '**', '*.{rb}')]

    # load_path for serializers classes
    config.autoload_paths += Dir[Rails.root.join('app', 'serializers', '**', '*.{rb}')]

    # load_path for values classes
    config.autoload_paths += Dir[Rails.root.join('app', 'values', '**', '*.{rb}')]

    # active storage
    config.active_storage.service = :local
  end
end
