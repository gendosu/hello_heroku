workers Integer(ENV['PUMA_WORKERS'] || 1)
thread_count = Integer(ENV['MAX_THREADS'] || 2)
threads thread_count, thread_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # worker specific setup
  ActiveRecord::Base.establish_connection
end

# before_fork do
#   require 'puma_worker_killer'
#
#   # hour (default 6 hours)
#   rolling_restart_frequency = ENV['ROLLING_RESTART_FREQUENCY'] || 6
#
#   PumaWorkerKiller.config do |config|
#     # config.ram           = 1024 # mb
#     # config.frequency     = 5    # seconds
#     # config.percent_usage = 0.98
#     config.rolling_restart_frequency = rolling_restart_frequency * 3600 # 3 hours in seconds
#   end
#
#   PumaWorkerKiller.enable_rolling_restart
# end
