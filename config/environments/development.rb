ResearchMatch::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # A dummy setup for development - no deliveries, but logged
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
  				     :authentication => :plain,
				     :address => "smtp.mailgun.org",
				     :port => 587,
				     :domain => "researchmatch.mailgun.org",
				     :user_name => "postmaster@researchmatch.mailgun.org",
				     :password => "1zx7p9jpmnw9"
				     }

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Logging
  config.log_level = :info

  # CAS authentication
#  CASClient::Frameworks::Rails::Filter.configure(
#    :cas_base_url => "https://wind.columbia.edu/"
#    #:cas_base_url => "https://auth-test.berkeley.edu/cas/"
#  )

  # ActionMailer
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.delivery_method = !!(ENV['action_mailer'] =~ /1|true/i) ? :smtp : :test
  puts "INFO: ActionMailer ON" if ActionMailer::Base.delivery_method == :smtp
end

