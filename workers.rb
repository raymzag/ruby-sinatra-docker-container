require 'bundler/setup'
require 'sneakers'
require 'sneakers/runner'
require './lib/worker'

Sneakers.configure(:amqp => ENV['RABBITMQ_URL'], :daemonize => false, :log => STDOUT)
Sneakers.logger.level = ::Logger::INFO

r = Sneakers::Runner.new([ MyWorker ])
r.run