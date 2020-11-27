Feature: Login Request

Scenario: Get User Auth0 Token
   Given I send credentials and send mark down body 
   
   """
   { 
     "client_id": "your_keys", 
     "client_secret": "your_keys", 
     "audience": "use_your_own_url",
     "grant_type":"client_credentials"
     }
   """

   Then the response status for bearer code should be "200"

Scenario: send user id and password in a json body
    Given I send and accept JSON
   
   Then the response status should be "200"