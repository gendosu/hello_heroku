class ViewCountJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    redis = Redis.new(:url => ENV['REDIS_URL'])
    redis.incr "topViewCount"
  end
end
