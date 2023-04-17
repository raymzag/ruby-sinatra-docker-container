class MyWorker
  include Sneakers::Worker
  from_queue 'myworker'

  def work(data)
    puts "executing at #{Time.now}"
    puts $posthog.get_feature_flag('test-feature', 1)
    ack!
  end
end