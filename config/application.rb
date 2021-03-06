require_relative 'boot'

require 'rails/all'
require 'json'
require 'net/http'
require 'uri'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ttflive
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.


    config.after_initialize do
      if Appstate.first.nil?
        Appstate.create(auto_update: false)
      else
        Appstate.first.update(auto_update: false)
      end
      Appstate.first.update(auto_update: true)
      ApplicationController.new.update
    end

  end
end
