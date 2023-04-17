require 'bunny'
require 'json'

conn = Bunny.new
conn.start

ch = conn.create_channel
ch.default_exchange.publish({}.to_json, routing_key: 'myworker')

conn.close