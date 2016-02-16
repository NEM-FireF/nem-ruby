#!/usr/bin/ruby

# Proof of Concept 
# 
# !!! Important Info !!!
# There is no check if Account private key belongs to delegated or regular account.
# So you risk to send your private key to a remote NIS and loose your XEM. 
# Make your you realy understand the NEM Concept.
#
# Don't use for production unless you now what you do.
#
# You have to put in delegated account Adress and delegated account privateKey into accounts.json
#
#
# This script was create by firef NAGNFJ-DG3UEU-KHRN4E-YOJR63-SFYFHC-AQHK4H-2TYO 
#



require 'net/http'
require 'json'
require 'uri'
 
module NisConnect
  BASE_URI = URI('http://supernode.nemno.de:7890')
  HTTP = Net::HTTP.new(BASE_URI.host, BASE_URI.port)
 
  def self.get(target, args={})
    unless args.nil?
      query = URI.encode_www_form(args) 
    end
    req =  Net::HTTP::Get.new target + "?" + query 
    res = HTTP.request(req)
    JSON.parse(res.body)
  end
   
  def self.post(target, args={})
    req = Net::HTTP::Post.new(target, initheader = {'Content-Type' =>'application/json'})
    req.body = args.to_json
    res = HTTP.request(req)
  end
end

Accounts = JSON.load(File.open(ARGV[0]))
Accounts.each do |acc|
  address = acc['address']
  privateKey = acc['privateKey']
  autoHarvest = acc['autoHarvest'] 

  response = NisConnect.get "/account/get", address:  address  
  status = response["meta"]["status"]

  if status == "LOCKED" 
    puts "Account #{address} is not harvesting"
    if autoHarvest
	puts "Enable Harvest"
        response = NisConnect.post '/account/unlock',  value: privateKey 
    else
       puts "Do not enable Harvest"
    end
 elsif status == "UNLOCKED"
    puts "Account #{address} is harvesting"
    if autoHarvest
      puts "Disable Harvest"
      response = NisConnect.post '/account/lock',  value: privateKey 
    end
  else
    puts "Some unexpected happened :-/"
  end
end
 


