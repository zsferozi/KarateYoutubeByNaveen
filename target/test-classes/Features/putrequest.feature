Feature: Update user using PUT request API

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
      {
       "status": "active",
       "email": "Karate@gmail.com"
      }
      """

  Scenario: update a user with the given data
    Given path '/public/v1/users/102'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Aagam Butt'
    And match $.data.email == 'Karate@gmail.com'
    * print response
