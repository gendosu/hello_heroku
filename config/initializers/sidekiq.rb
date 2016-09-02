# require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV['REDIS_URL'],
    namespace: 'sidekiq',
    network_timeout: 10,
  }
end

# When in Unicorn, this block needs to go in unicorn's `after_fork` callback:
Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV['REDIS_URL'],
    namespace: 'sidekiq',
  }
end

# schedule_file = File.join(Rails.root, "config/sidekiq_schedule.yml")
#
# if File.exists?(schedule_file)
#   Sidekiq::Cron::Job.load_from_hash YAML.load(ERB.new(File.read(schedule_file)).result)
# end
