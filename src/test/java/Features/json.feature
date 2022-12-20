Feature: json feature testing

  Scenario: json reader parser
    # we create a json array and array start from index zero
    * def jsonObject =
      """
      [
      {
      "name" : "Tom",
      "city" : "Bangalore",   
      "age" : 26
      },
      {
      "name" : "Ahmad",
      "city" : "Kabul",
      "age" : 27
      }
      ]
      """
      * print jsonObject
      # we want to extract some thing from this Json array
      #* print jsonObject [0]
      #but if we want to fetch one element from the json object of index 0 
      * print jsonObject[0].name
      * print jsonObject[1].name +" "+jsonObject[1].city +" "+ jsonObject[1].age
      
      Scenario: complex json reader
      # this is a json object in this jsonobject we have number of child json object 1 pop json and a menuitem is a json array 
      # which is based on the key and value
      * def jsonObject = 
      """ 
      {"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}
}
"""
 * print jsonObject
 * print jsonObject.menu.id
 
 # if I want to fetch only the menu popup I write like this
 * print jsonObject.menu.popup
 #if we only want to fetch the data from menuitem 
 * print jsonObject.menu.popup.menuitem
 
 * print jsonObject.menu.popup.menuitem[0].onclick

