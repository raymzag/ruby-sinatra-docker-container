require 'posthog-ruby'

class MyWorker
  include Sneakers::Worker
  attr_reader :posthog

  def initialize(...)
    super(...)
    @posthog = PostHog::Client.new({
      api_key: ENV['POSTHOG_API_KEY'],
      personal_api_key: ENV['POSTHOG_PERSONAL_KEY'],
      host: ENV['POSTHOG_HOST'],
      feature_flags_polling_interval: 10,
      on_error: Proc.new { |status, msg| print msg }
    })
    @posthog.logger.level = Logger::DEBUG
  end

  from_queue 'myworker'

  def work(data)
    puts "executing at #{Time.now}"
    puts @posthog.get_feature_flag('test-feature', 1)
    ack!
  end
end