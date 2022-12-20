Feature: print hello world feature

  Scenario: Hello world sceanrio
    * print 'hello world'
    * print 'hello new Zahal'

  Scenario: declare and print a variable
    * def balance = 200
    * def fee = 20
    * def tax = 10
    * print 'total amount ->' + (balance + fee + tax)
    
 Scenario: calculate scenario
    * def a = 200
    * def b = 20

    * print 'multiplication ->' + (a * b)