require 'bundler/setup'
require 'sneakers'
require 'sneakers/runner'
require './lib/worker'
require 'posthog-ruby'

Sneakers.configure(
  :amqp => ENV['RABBITMQ_URL'],
  :daemonize => false,
  :log => STDOUT,
  workers: 1
)
Sneakers.logger.level = ::Logger::INFO

$posthog = PostHog::Client.new({
  api_key: ENV['POSTHOG_API_KEY'],
  personal_api_key: ENV['POSTHOG_PERSONAL_KEY'],
  host: ENV['POSTHOG_HOST'],
  feature_flags_polling_interval: 10,
  on_error: Proc.new { |status, msg| print msg }
})
$posthog.logger.level = Logger::DEBUG

r = Sneakers::Runner.new([ MyWorker ])
r.run