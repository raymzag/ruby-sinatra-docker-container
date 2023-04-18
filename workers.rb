require 'bundler/setup'
require 'sneakers'
require 'sneakers/runner'
require './lib/worker'

Sneakers.configure(
  :amqp => ENV['RABBITMQ_URL'],
  :daemonize => false,
  :log => STDOUT,
  workers: 1
)
Sneakers.logger.level = ::Logger::DEBUG

r = Sneakers::Runner.new([ MyWorker ])
r.run