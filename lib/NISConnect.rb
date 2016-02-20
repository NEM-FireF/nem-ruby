require 'net/http'
require 'json'
require 'uri'
 
class NISConnect

  def initialize(params={})
    @base_uri = URI(params[:url])
    @http = Net::HTTP.new(@base_uri.host, @base_uri.port)
  end

  def get(target, args={})
    unless args.nil?
      query = URI.encode_www_form(args) 
    end
    req =  Net::HTTP::Get.new target + "?" + query 
    res = @http.request(req)
    JSON.parse(res.body)
  end
   
  def post(target, args={})
    req = Net::HTTP::Post.new(target, initheader = {'Content-Type' =>'application/json'})
    req.body = args.to_json
    res = @http.request(req)
  end
end
 


