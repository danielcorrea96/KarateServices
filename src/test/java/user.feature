Feature: Check returned users by the API

  Background:
    * url 'https://gorest.co.in/'
    * header Authorization = 'Bearer 7e8dc02a9986317dce36566192cc818d4f9e867e112fb8a71f39afc4b6e63814'

  @get
  Scenario: List all the users having name with john
    Given path '/public/v1/users'
    And param 'name' = 'pqr'
    When method GET
    Then status 200
    And def userResponse = response
    Then match userResponse.data[*].name contains ["Diego Correa"]

  @contentType
  Scenario: Request with Empty string as content-type
    Given path 'public/v1/users', 'headers'
    And header Content-Type = ''
    When method GET
    Then status 500
    And def temp = response
    * print temp


  @post
  Scenario: Create new User
    Given path '/public/v1/users'
    And request {"name":"Diego Correa", "gender":"male", "email":"diego.correa88@15ce.com", "status":"active"}
    When method POST
    Then status 201
    And path '/public/v1/users'
    And param 'name' = 'pqr'
    And method GET
    Then status 200
    And def userResponse = response
    Then match userResponse.data[*].name contains ["Diego Correa"]