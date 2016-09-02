class TopController < ApplicationController
  def index
    ::ViewCountJob.perform_later

    redis = Redis.new(:url => ENV['REDIS_URL'])

    @top_view_count = redis.get('topViewCount')
  end
end
