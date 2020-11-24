Feature: Login Request
Scenario: send user id and password in a json body
    Given I send and accept JSON
   
   Then the response status should be "200"