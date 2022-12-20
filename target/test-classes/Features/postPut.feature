Feature: create user using POST API
#this is how we do end to end testing with Karate
  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
      {
          "id": 0,
          "name": "Freshta",
          "email": "Freshta24@hotmail.com",
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
    # fetch the user id from the post call response
    * def userId = $.data.id
    * print userId
    # put call to update the user
    * def requestPayload =
      """
      {
      "gender":"male",
      "status":"Dead"
      }
      """
    Given path 'public/v1/users/' +userId
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == 'Freshta'
    And match $.data.email == 'Freshta24@hotmail.com'
    * print response
