class MyWorker
  include Sneakers::Worker
  from_queue 'myworker'

  def work(data)
    puts "executing at #{Time.now}"
    puts data
    ack!
  end
end