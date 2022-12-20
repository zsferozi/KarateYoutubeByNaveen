Feature: create user using POST API

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
      {
          "id": 0,
          "name": "Freshta",
          "email": "Freshta152@hotmail.com",
          "gender": "female",
          "status": "active"
      }
      
      """

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Freshta'
    And match $.data.email == 'Freshta152@hotmail.com'
