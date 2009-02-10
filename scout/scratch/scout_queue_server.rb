#!/usr/bin/env ruby
require 'thread'    #Google "wiki threads computer science"
require 'drb'

$SAFE = 1           #This is a special variable that Ruby interprets as the level of safety/paranoia for this script

#The service is running on localhost (127.0.0.1) on port 61676:
def run_queue(url='druby://127.0.0.1:61676')
  queue = Queue.new # Containing the jobs to be processed
  
  #Start up DRb with URI and object to share:
  DRb.start_service(url, queue)
  puts "Listening for connection..."
  while job = queue.deq
    yield job
  end
end

#Do stuff:
run_queue do |job|
  case job['request']
  when 'Report'
    puts "Reporting for #{job['from']}... Done."
  when 'Process'
    puts "Processing for #{job['from']}... Done."
    sleep 3 #Simulate real work that has a longer delay. Replace this line with actual work (i.e. the core of the spider).
    puts 'Processing complete'
  end
end
