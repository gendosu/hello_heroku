class TopController < ApplicationController
  def index
    ViewCountJob.enqueue

    redis = Redis.new(:url => ENV['REDIS_URL'])

    @top_view_count = redis.get('topViewCount')
  end
end
