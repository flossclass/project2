require 'net/http'
require 'uri'
require 'rubygems'
require 'xmlsimple'
require 'pp'

#http://www.dapper.net/RunDapp?dappName=GuitarCenter&v=1&v_item_name=fender
base_url = 'http://www.dapper.net/RunDapp'

puts "this is the item we are querying: " + item_name

#1: Simple POST. This will automatically construct the query string:
response_object = Net::HTTP.post_form(URI.parse(base_url),
                          {'dappName'=>'GuitarCenter', 'v'=>'1',
                            'v_item_name' => item_name
                          }
                          )

puts "Got HTTP status code " + response_object.code

#Check for HTTP status code above 200 and error if encountered:
#First, convert the code to a number/integer via the "to_i" method and compare to 200:
if response_object.code.to_i > 200
  puts "Got bad response after attempting to query the following URL: #{base_url}"
  exit 1
end

xml = response_object.body

doc = XmlSimple.xml_in xml

#A datastructure is just a complex structure of variables, i.e. "a hash of arrays" or "an array of hashes"
#These are sometimes called "multidimensional hashes" and "multidimensional arrays":
print %{This is the printout of the 'doc' datastructure.
'doc' is a hash with two keys that store arrays in them.
We're only interested the 'listing' key, and we'll store its value (an array)
in the variable called 'doc_listing_array' below
\n
}

#Print out the doc datastructure:
pp doc

print %{This is the printout of the 'doc_listing_array' datastructure, derived from 
print "the 'doc' datastructure:
\n
}

doc_listing_array = doc["listing"]
#Print out the doc_listing_array datastructure:
pp doc_listing_array




