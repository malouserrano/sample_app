Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.action_mailer.perform_caching = false
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true
  config.active_storage.service = :local
  # config.action_mailer.delivery_method = :test
  host = 'localhost:3000' #local server
  config.action_mailer.default_url_options = { host: host, protocol: 'http' }

  config.action_mailer.delivery_method = :smtp
  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :user_name            => ENV['gmail_username'],
   :password             => ENV['gmail_password'],
   :authentication       => "plain",
  :enable_starttls_auto => true
  }

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else

    config.cache_store = :null_store
  end

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
