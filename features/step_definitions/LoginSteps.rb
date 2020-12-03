require "uri"
require "net/http"
require 'openssl'
require "rspec/expectations"

access_token = ''
customer_guid = ''
Given /^I send credentials and send mark down body$/ do |credentials|
  url = URI("https://dev-8s97qw7o.auth0.com/oauth/token")
  
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  https.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Post.new(url)
  request["content-type"] = 'application/json'
  request.body = credentials
  
  @response = https.request(request)
  access_token = JSON.parse(@response.body)['access_token']
  puts access_token
 
  
end 

Then /^the response status for bearer code should be "([^"]*)"$/ do |status|
  begin
    @response.code.should eq(status)
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response body:"
    raise e
  end
end




Given /^I send and accept JSON$/ do
  url = URI("https://localhost:44398/api/AppUser/LoginUser")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    puts @access_token
    request["Authorization"] = "Bearer " + access_token
    request["Content-Type"] = "application/json"
    request.body = "{\r\n  \"appUserId\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\",\r\n  \"appUserName\": \"sqadri1166\",\r\n  \"appNameDesc\": \"string\",\r\n  \"appRoleId\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\",\r\n  \"appUserPwd\": \"Astaghee@166\",\r\n  \"isActive\": true,\r\n  \"createdDate\": \"2020-11-18T14:47:38.636Z\",\r\n  \"createdBy\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\"\r\n}"

    @responseobj = https.request(request)
    customer_guid =  JSON.parse(@responseobj.body)['customerTokenId']
    puts customer_guid
    

end


Then /^the response status should be "([^"]*)"$/ do |status|
  begin
    @responseobj.code.should eq(status)
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response body:"
    raise e
  end
end

Given /^i send data for buyers information and accept  data in JSON$/ do
  url = URI("https://localhost:44398/api/AppBuyer/GetAllBuyers")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    
    request["Authorization"] = "Bearer " + access_token
    request["Content-Type"] = "application/json"
    request['CustomerGuidKey'] = customer_guid 
    @responseJ = https.request(request)
    puts @responseJ
    @buyers =    JSON.parse(@responseJ.body) 
       

end 

Then /^the buyer response status should be "([^"]*)"$/ do |status|
  begin
    @responseJ.code.should eq(status)
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response body:"
    raise e
  end
end

And /^the buyer array length should be greater the zero$/ do 
  begin
    JSON.parse(@responseJ.body).length.should eq(3) 
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response body:" 
    raise e
  end
end