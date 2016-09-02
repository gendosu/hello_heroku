class TopController < ApplicationController
  def index
    redis = Redis.new(:url => ENV['REDIS_URL'])
    redis.set("mykey", "hello world")
    @result = redis.get("mykey")
  end
end
