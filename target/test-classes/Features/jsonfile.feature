Feature: create user using POST API

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
   
    

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Freshta'
    And match $.data.email == "Freshta16@hotmail.com"
    * print response
