require './app'
require 'posthog-ruby'

$posthog = PostHog::Client.new({
                                 api_key: ENV['POSTHOG_API_KEY'],
                                 personal_api_key: ENV['POSTHOG_PERSONAL_KEY'],
                                 host: ENV['POSTHOG_HOST'],
                                 feature_flags_polling_interval: 10,
                                 on_error: Proc.new { |status, msg| print msg }
                               })
$posthog.logger.level = Logger::DEBUG

run Sinatra::Application