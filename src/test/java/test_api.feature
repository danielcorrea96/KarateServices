Feature: Fetching User Details

  Scenario: Testing the get call for User Details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200


    Scenario: Create token
      Given url ''