@Automation
Feature: Automation Apis

  Background:
    * def posToken = read("PostToken.json")
    * def succesFullToken = read("succesFullToken.json")
    * def succesfullResponseGet = read("succesfull-response-get.json")
    * def succesBooking = read("succesBooking.json")
    * def CreateBookingPost = read("CreateBookingPost.json")
    * def BookingUpdate = read("BookingUpdate.json")
    * def SuccesDelete = read("SuccesDelete.json")

  Scenario Outline:  Generate token
    Given url "<Url>"
    And request posToken
    When method <Method>
    Then status <Status>
    And match  $ == succesFullToken
    Examples:
      | Url                                       | Method | Status |
      | https://restful-booker.herokuapp.com/auth | post   | 200    |


  Scenario: Get booking information
    Given url "https://restful-booker.herokuapp.com/booking"
    When method get
    Then status 200
    And match $okingid[0] == $..bookingid[0]succesfullResponseGet


  Scenario: Succes get user for id
    Given url "https://restful-booker.herokuapp.com/booking/1"
    When method get
    Then status 200
    And match $ == succesBooking

  Scenario: User not found for id
    Given url "https://restful-booker.herokuapp.com/booking/118766"
    When method get
    Then status 404
    And match $ == Not found


  Scenario Outline: Create booking
    Given url "<Url>"
    When method <Method>
    And request CreateBookingPost
    Then status <Status>
    Examples:
      | Url                                          | Method | Status |
      | https://restful-booker.herokuapp.com/booking | post   | 200    |


  Scenario Outline: Update booking booking
    Given url "<Url>"
    When method <Method>
    And request CreateBookingPost
    And header 'Content-Type' = 'application/json'
    And header 'Accept' = 'application/json'
    And header 'Cookie' = 'token=abc123'
    * configure connectTimeout = 1500000
    * configure readTimeout = 1500000
    Then status <Status>
    Examples:
      | Url                                            | Method | Status |
      | https://restful-booker.herokuapp.com/booking/1 | put    | 200    |

  Scenario: Succes delete
    Given url "https://restful-booker.herokuapp.com/booking/1
    When method get
    Then  status 200
    And match $ == SuccesDelete
