#!/usr/bin/env ruby
require 'thread'
require 'drb'

NAME = 'price scout client'

DRb.start_service
#The service is running on localhost (127.0.0.1) on port 61676: 
queue = DRbObject.new_with_uri("druby://127.0.0.1:61676")

10.times do
  #Make a request of type "Process" to the server from this client:
  queue.enq('request' => 'Process', 'from' => NAME)
end

10.times do
  #Make a request of type "Report" to the server from this client:
  queue.enq('request' => 'Report', 'from' => NAME)
end
