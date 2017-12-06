require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PairBnB
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.active_job.queue_adapter = :sidekiq
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
	  address:              'smtp.gmail.com',
	  port:                 587,
	  domain:               'example.com',
	  user_name:            ENV['GMAIL_USERNAME'],
	  password:             ENV['GMAIL_PASSWORD'],
	  authentication:       'plain',
	  enable_starttls_auto: true  }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
