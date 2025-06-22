@listUser
Feature: List users

  @listUserByPage
  Scenario: List user by page
    Given url "https://reqres.in/api/users?page=2"
    When  method get
    Then  status 200
    And   print response
    *     print response.data[0].last_name
    *     match response.page == 2
    *     match response.per_page == 6


  @listUserByPages
  Scenario Outline: List users on page <page>
    Given url "https://reqres.in/api/users?page="+<page>
    And   header x-api-key = "reqres-free-v1"
    When  method get
    Then  status 200
    Examples:
      | page |
      | 1    |
      | 3    |
      | 4    |
