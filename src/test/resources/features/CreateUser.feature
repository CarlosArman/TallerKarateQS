@createUser @reqres
Feature: Create User

  Background:
    * configure ssl = true
    Given url "https://reqres.in"

  @createAUser
  Scenario: Create a user
    *     path "/api/users"
    *     header x-api-key = "reqres-free-v1"
    And   request { "name": "morpheus", "job": "leader" }
    When  method post
    Then  status 201

  @createUserJson
  Scenario: Create a user from a json file
    *     path "/api/users"
    *     header x-api-key = "reqres-free-v1"
    *     def bodyRequest = read("classpath:data/UserNew.json")
    And   request bodyRequest
    When  method post
    Then  status 201

  @createUsers
  Scenario Outline: Create user <id> with name <name> and job <job>
    *     path "/api/users"
    *     header x-api-key = "reqres-free-v1"
    And   request
    """
    {
  "name": "<name>",
  "job": "<job>"
   }
    """
    When  method post
    Then  status 201
    * match response.name == '#string? _ == "<name>"'
    * match response.job == '#string? _ == "<job>"'

    Examples:
      | id | name     | job    |
      | 1  | morpheus | leader |
      | 2  | jonas    | qa     |
      | 3  | josue    | dev    |