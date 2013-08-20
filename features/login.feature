@login
Feature:  Logging into the GitHub application

  Scenario: Logging in successfully
    When we give valid credentials
    Then we end up on the home screen

  Scenario: Failing hard to login
    When we fail hard to login
    Then we are yelled at by GitHub
