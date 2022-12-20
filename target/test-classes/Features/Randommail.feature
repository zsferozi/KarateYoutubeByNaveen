Feature: create user using POST API

  Background: 
    * url 'https://gorest.co.in'
    #this is javascrip for creating random email address
    # this is an end to end testing
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = 'abadb712b0474a94f66082e11cddefb1ae95ea3002e670ae695c4364d17747e8'
      for(var i=0; i<s; i++)
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
      
      }
      """
    * def randomString = random_string(10)
    * print randomString
    * def requestPayload =
      """
      {
          "id": 0,
          "name": "Freshta",
          "email": "Freshta12@gmail.com",
          "gender": "female",
          "status": "active"
      }

      """
      #we cancate the random name to @gmail.com
    * requestPayload.email = randomString +"@gmail.com"
    * print requestPayload

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Freshta'
    And match $.data.email == requestPayload.email
    * print response
