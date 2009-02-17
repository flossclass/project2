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
  puts 'I got....'+ job["query"]
  puts 'I got....'+ job["price"]
  puts 'I got....'+ job["request_id"]
  puts 'I got....'+ job["max_listings_returned"]
  
end
