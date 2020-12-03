Feature: Login Request

Scenario: Get User Auth0 Token
   Given I send credentials and send mark down body 
   
   """
   { 
     "client_id": "BadElW3sKo6whvAM1UHOEI3WcjkDGZ1w5T6", 
     "client_secret": "BadZtOKLFyTRwe3GmsIPLJzMBCKn3zXmAlbAiFI85xBtesf2Fe7GOgE6VBwWHov5O3q", 
     "audience": "https://bluevision.com",
     "grant_type":"client_credentials"
     }
   """

   Then the response status for bearer code should be "200"

Scenario: send user id and password in a json body
    Given I send and accept JSON
   
   Then the response status should be "200"
   
Scenario: Load all buyers 
  Given i send data for buyers information and accept  data in JSON

  Then the buyer response status should be "200"

  And the buyer array length should be greater the zero