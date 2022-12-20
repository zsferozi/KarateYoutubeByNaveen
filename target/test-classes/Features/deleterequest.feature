Feature: Delete user using delete API

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
        
          "name": "Freshta",
          "gender": "female",
          "status": "inactive"
      }

      """
     
    * requestPayload.email = randomString +"@gmail.com"
    * print requestPayload

  Scenario: Delete a user with the given user id
  # create a user using post id 
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
   
   # fetch the user id 
   * def userId = $.data.id
   * print userId
   #2 delete the same user
    Given path '/public/v1/users/' + userId
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method Delete
    Then status 204
    #3 get the same userId 
    Given path '/public/v1/users/' + userId
    When method GET 
    Then status 404
    And match $.data.message == 'Resource not found'
    
   

