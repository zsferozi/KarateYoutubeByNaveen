Feature: GET API feature

Scenario: get user details
# our baseUrl is in Karate-config.js file we simply concate it next to the end point here
Given url baseUrl+'/public/v1/users'
And path '30'
When method get
Then status 200
* print response
# when we want to store it in a variable

* def jsonResponseVariable = response
* print jsonResponseVariable
* def actualName = jsonResponseVariable.data.name
* def actualId = jsonResponseVariable.data.id
* def actualEmail = jsonResponseVariable.data.email
* print actualName
* match actualName == 'Laxman Bharadwaj'
* match actualId == 30
* match actualEmail == 'bharadwaj_laxman@macgyver.info'

Scenario: get user details- user not found
Given url 'https://gorest.co.in/public/v1/users'
And path '1'
When method get
Then status 404