require "uri"
require "net/http"
require 'openssl'
require "rspec/expectations"



Given /^I send credentials and send mark down body$/ do |credentials|
  url = URI("https://dev-8s97qw7o.auth0.com/oauth/token")
  
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  https.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Post.new(url)
  request["content-type"] = 'application/json'
  request.body = credentials
  
  @response = https.request(request)
  puts @response.read_body
  
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
    request["Authorization"] = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlJqRTJRVVZFTWpFME5URXlORUZCUTBFMU9UaEdRVEEwUVVRek1USkRRemd4T1VGRE5qQkJNUSJ9.eyJpc3MiOiJodHRwczovL2Rldi04czk3cXc3by5hdXRoMC5jb20vIiwic3ViIjoiRWxXM3NLbzZ3aHZBTTFVSE9FSTNXY2prREdaMXc1VDZAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYmx1ZXZpc2lvbi5jb20iLCJpYXQiOjE2MDYxNDY3NDUsImV4cCI6MTYwODczODc0NSwiYXpwIjoiRWxXM3NLbzZ3aHZBTTFVSE9FSTNXY2prREdaMXc1VDYiLCJzY29wZSI6IioiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.JNf7pyUDJjd8rwF5mK7KT1EeseWZdNcDYZHWQzZw6sKEygORUoXa5IR_0Q2tv0roHM4Elv18jePBTLZb1c-a2CXu9voiwAJGn71dfQfnNK27He2xB9Hj29siKzcG5xphyxyuxHCPMHJbM-Xr6FNUVT3nXMBCr75-TIsl9shI4qLH-2YJeEmuRxaV3slOw1Dfqy_Tam91b5V-gjas50OR9-f4ZUO4BZnbo_8-T5Em24KtaUAI7NX1CsBjG0CeXGd3htN4EPeCzoA9h7GnbhvyNkzTU4l8bY7WD1Y_bSBKNsdv_BkxC2KjN6aGpQxbTdGbCG5Emp2vkn9N4ctv8tKYAw"
    request["Content-Type"] = "application/json"
    request.body = "{\r\n  \"appUserId\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\",\r\n  \"appUserName\": \"sqadri1166\",\r\n  \"appNameDesc\": \"string\",\r\n  \"appRoleId\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\",\r\n  \"appUserPwd\": \"Astaghee@166\",\r\n  \"isActive\": true,\r\n  \"createdDate\": \"2020-11-18T14:47:38.636Z\",\r\n  \"createdBy\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\"\r\n}"

    @responseobj = https.request(request)
    

end


Then /^the response status should be "([^"]*)"$/ do |status|
  begin
    @responseobj.code.should eq(status)
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response body:"
    raise e
  end
end


